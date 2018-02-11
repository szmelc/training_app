class WebsiteInput < SimpleForm::Inputs::StringInput
  def input
    @builder.input(attribute_name, input_html: {value: 'http://'}, label: false)
  end
end
