module TopUsers
    class BaseQuery
  
      def initialize(relation = User.joins(:comments), days_amount:)
        @relation = relation
        @days_amount = days_amount
      end
  
      attr_reader :relation, :days_amount
  
    end
  end 