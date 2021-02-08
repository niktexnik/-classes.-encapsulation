require_relative '../main.rb'
RSpec.describe MyClass do
  it 'initializes with `value` and `password`' do
    expect{ MyClass.new('somevalue', 'somepassword') }.not_to raise_error
  end

  it 'can greet' do
    instance = MyClass.new('somevalue', 'somepassword')
    expect(instance.greet).to eq('My class said: somevalue')
  end

  it 'can\'t return unsecure password (it doesn\'t have `password` method in its public API)' do
    instance = MyClass.new('somevalue', 'somepassword')
    expect{ instance.password }.to raise_error(NoMethodError)
  end

  it 'shows password first 4 signs (when the password is `mypornhubpassword` it shows `mypor************`)' do
    instance = MyClass.new('somevalue', 'mypornhubpassword')
    expect(instance.show_safe_password).to eq('mypor************')
  end

  it 'shows password first 4 signs (when the password is `Pa$$w0rd` it shows `Pa$$w***`)' do
    instance = MyClass.new('somevalue', 'Pa$$w0rd')
    expect(instance.show_safe_password).to eq('Pa$$w***')
  end

  it 'shows password first 4 signs (when the password is `Qwerty123` it shows `Qwert****`)' do
    instance = MyClass.new('somevalue', 'Qwerty123')
    expect(instance.show_safe_password).to eq('Qwert****')
  end
end