class TopUsersController < ApplicationController

    def index
      @top_users = TopUsers::UsersQuery.new(days_amount: 7).find_top_users(amount:10)
    end
  
  end 