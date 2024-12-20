class AddressFilter
    class << self
      def retrieve_all
        Address.all
      end
  
      def find_by_id(id)
        Address.find(id)
      end
    end
  end