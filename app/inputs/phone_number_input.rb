class PhoneNumberInput < SimpleForm::Inputs::Base
  def input
    ActiveSupport::SafeBuffer.new.tap do |out|
      @builder.simple_fields_for attribute_name, number do |ff|
        out << ff.input(:phone_number, label: false)
      end
    end
  end

  def number
    object.send(attribute_name)
  end
end
