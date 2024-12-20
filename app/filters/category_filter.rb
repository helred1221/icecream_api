class CategoryFilter
    class << self
      def retrieve_all
        Category.all
      end
  
      def find_by_id(id)
        Category.find(id)
      end
    end
  end