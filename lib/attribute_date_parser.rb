module AttributeDateParser
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def parse_date(*attributes)
      attributes.each do |attribute|
        define_method("#{attribute}=") do |date|
          if date.is_a?(String)
            date = Kronic.parse(date)
          end
          write_attribute attribute, date
        end
      end
    end
  end
end