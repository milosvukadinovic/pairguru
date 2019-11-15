module TopUsers
    class UsersQuery < BaseQuery
  
      def find_top_users(amount:)
        order_users_desc.limit(amount)
      end
  
      def by_weeks_ago
        relation.where(comments: {created_at: (Time.now - days_amount.day).midnight..(Time.now) })
      end
  
      def select_users_data
        by_weeks_ago.select("users.id, users.name, users.email, COUNT(comments.id) AS comments_amount")
      end
  
      def group_users_by_name
        select_users_data.group('users.id')
      end
  
      def order_users_desc
        group_users_by_name.order("comments_amount DESC")
      end
  
    end
  end