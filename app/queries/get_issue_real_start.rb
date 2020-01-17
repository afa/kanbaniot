class GetIssueRealStart
  attr_reader :issue

  def initialize(issue)
    @issue = issue
  end

  def call
    query_select(:get_real_start).to_a.first&.dig('start')
  end

  def query_select(method_sym)
    sql = method(method_sym).call(@issue)
    return [] if sql.nil?

    @query ||= ActiveRecord::Base.connection_pool.with_connection { |conn| conn.exec_query(sql) }
  end

  def get_real_start(issue)
    <<-SQL
      WITH real_start(start, status_id) as (
        select
          journals.created_on start,
          cast(journal_details.value as integer) status_id
	from journal_details
	inner join journals on journals.id = journal_details.journal_id
        where journal_details.property = 'attr' and journal_details.prop_key = 'status_id'
	  and journals.journalized_id = #{issue.id}
	order by journals.created_on
      )
      select * from real_start
    SQL
  end
end
