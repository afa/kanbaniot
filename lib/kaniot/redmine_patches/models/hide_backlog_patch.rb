module Kaniot
  module HideBacklogPatch
    def self.prepended(base)
      base.prepend(InstanceMethods)
    end

    module InstanceMethods
      def kanban_column_definition(phase_type, phase_position = nil)
        return super if User.current.admin?

	return {} if phase_type == EasyKanbanIssue::TYPE_BACKLOG

	super
      end
    end
  end
end

EasyAgileBoard::EasyQueryOutputs::AgileKanbanOutput.prepend(Kaniot::HideBacklogPatch)
