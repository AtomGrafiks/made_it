module MadeIt
  module ActiveRecord
    extend ActiveSupport::Concern
 
    included do
    end
 
    module ClassMethods
      # Helper method for has_many association with a nested through association
      # Use (in class User for example):
      #   has_many_through :projects
      #
      # The method generate two associations:
      #   has_many :projects_users, dependent: :destroy
      #   has_many :projects, through: :projects_users
      #
      # You can add more options to association_table `projects_users` with opts argument
      # You can override association_table with opts `association_table`
      # Exemple for a polymorphic link:
      #    has_many_through :groups, association_table: :groups_relations, as: :relationnable
      def has_many_through(linked_table, opts = {})
        opts[:association_table] ||= [to_s.classify.pluralize, linked_table.to_s.classify.pluralize].sort.join.underscore

        has_many opts[:association_table].to_sym, nil, { dependent: :destroy }.merge(opts.reject { |k| k.in? [:association_table] })
        has_many linked_table.to_sym, through: opts[:association_table].to_sym
      end

      # Helper method to create powerful associations with polymorphism
      # Use (in class Permission for example):
      #   polymorphic_many_and_through    :permissions_relations, :relationable, %w[User Group]
      #
      # The method generate X associations:
      #   has_many :permissions_relations, dependent: :destroy, inverse_of: :permission
      #   has_many :users, through: :permissions_relations, source: :relationable, source_type: User
      #   has_many :groups, through: :permissions_relations, source: :relationable, source_type: Group
      #
      # You can add more options to association_table `permissions_relations` with opts argument
      def polymorphic_many_and_through(through, source, associations, opts = {})
        has_many through.to_sym, nil, { dependent: :destroy, inverse_of: to_s.downcase.to_sym }.merge(opts)
        associations.each do |klass|
          has_many klass.downcase.pluralize.to_sym,
                   through: :"#{through.to_sym}",
                   source: source.to_sym,
                   source_type: klass
        end
      end
    end
  end
end