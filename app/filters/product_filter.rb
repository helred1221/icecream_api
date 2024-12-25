class ProductFilter
    class << self
      def retrieve_all
        Product.all
      end
  
      def find_by_id(id)
        Product.find(id)
      end
    end
  end