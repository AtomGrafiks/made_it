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

      # Helper method to auto downcase without self callback declaration
      # Use (in class User for example):
      #   downcse_field  :first_name
      # You can edit when process is call with `callback` with opts argument
      #   downcse_field, :first_name, callback: :after_commit
      def downcase_field(field, opts = {})
        made_methods_transform_string :downcase, field, opts
      end

      # Helper method to auto upcase without self callback declaration
      # Use (in class User for example):
      #   upcase_field  :first_name
      # You can edit when process is call with `callback` with opts argument
      #   upcase_field, :first_name, callback: :after_commit
      def upcase_field(field, opts = {})
        made_methods_transform_string :upcase, field, opts
      end

      # Helper method to auto capitalize without self callback declaration
      # Use (in class User for example):
      #   capitalize_field  :first_name
      # You can edit when process is call with `callback` with opts argument
      #   capitalize_field, :first_name, callback: :after_commit
      def capitalize_field(field, opts = {})
        made_methods_transform_string :capitalize, field, opts
      end

      private

      def made_methods_transform_string(method, field, opts = {})
        opts[:callback] ||= :before_validation
        send(opts[:callback].to_sym, -> { send(field.to_sym).send("#{method}!".to_sym) })
      end
      # %i[chop, squueze]. each do |method|
      #   define_method "#{method}_field" do
      # end
    end
  end
end
