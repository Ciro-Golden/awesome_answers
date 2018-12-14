#To Generate this file do: 
# rails g cancan:ability

class Ability
  include CanCan::Ability #All the methods use the cancan ability will be part of this class.

  def initialize(user) #this will be the current user when running the block.
    #Inside 👍🏼 of this method, "user" is the "current_user"
    #To use cancancan, you must define the "current_user" method in the "ApplicationController" ****

    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in) it only asigns if it doesn't exists .
      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    
    alias_action(:create, :read, :edit, :update, :delete, to: :crud)
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    # To define a permissions for a user, use the "Can" method insde of this class
    # "initialize" method. It takes the following args., in order: 
    # - The name of the action your are testing permission for as a symbol.
    # (e.g. :crud, :edit, :delete, :like, :favourite)
    # The class of an object we're testing the action against.
    # (e.g. Question, Answer, User, etc)
    # A block that is used to determine whether or not a user can perform said action on the resource
    # If the block returns "True", the user can perform the action. Otherwise, they can't.

    can(:edit, Question) do |question|#if this blocks returns true they can edit true: If it returns false they can not edit question
       question.user == user #current_user if its the same then it returns true: "which means they can edit the question" otherwise NO!
      end
       can(:crud, Answer) do |answer|
        answer.user == user
      end
    end
  end
