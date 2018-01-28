class CountrySelectInput < SimpleForm::Inputs::CollectionInput
  ALL_COUNTRIES = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Argentina',
    'Benin',
    'Bermuda',
    'Belarus',
    'Burkina Faso',
    'Cambodia',
    'Birma',
    'Chile',
    'Croatia',
    'Colombia',
    'Croatia',
    'Denmark',
    'Fiji',
    'Finland',
    'Gabon',
    'Germany',
    'Greece',
    'Haiti',
    'Moldova',
    'Mongolia',
    'Oman',
    'Norway',
    'Poland',
    'Portugal',
    'Spain',
    'Sweden',
    'United Kingdom',
    'United States',
    'Vatican',
    'Zanzibar'
  ]

  POPULAR_COUNTRIES = [
    'Poland',
    'Vatican',
    'Germany',
    'United Kingdom',
    'United States',
  ]

  LIST = (POPULAR_COUNTRIES + ALL_COUNTRIES).uniq

  def input
    @builder.input(:country, collection: CountrySelectInput::LIST, label: false)
  end
end


