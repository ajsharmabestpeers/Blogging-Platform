# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    
    user ||= User.new   # guest user (not logged in)
    if user.admin?      # Admin can manage all resources
      can :manage, :all
      can :manage, Category, user_id:user.id
    elsif user.author?  # Author manage own posts (create,edit , update, destroy)
      can :manage, Post 
      can :manage, Comment
      can :manage, Category
    else
      can :read, Post  # Reader can only read posts
      # can :manage , Comment
      can :manage, Comment, user_id: user.id
      can :read, Category
    end
   
  end
end
