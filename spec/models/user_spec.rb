require 'rails_helper'
RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "正しい値を入れると登録できる"do
      @user.valid?
    end
  end
end

context '新規登録がうまくいかないとき' do
  
  it "nicknameが空だと登録できない" do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  
  it "メールアドレスが空だと登録できない" do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  
  it "メールアドレスが一意性であること" do
    @user.save
    @user2.email = @user.email
    @user2.valid?
    expect(@user2.errors.full_messages).to include("Email has already been taken")
  end
  
  it "メールアドレスは、@が入らないと登録できない" do
    @user.email = 'aaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  
  it "パスワードが空だと登録できない" do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password 半角英数文字入りで")
  end
  
  it "パスワードは、6文字以上でないと登録できない" do
    @user.password = 'aaaa1'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  
  it "パスワードは、半角英数字混合での入力じゃないと登録できない" do
    @user.password = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password 半角英数文字入りで")
  end
  
  it "パスワードは、確認用を含めて2回入力すること" do
    @user.password = 'aaa111'
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  
  
  it "ユーザー本名は、名字が入力されないと登録できない" do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角ひらがなカタカナ漢字で")
  end
  
  it "ユーザー本名は、名前が入力されないと登録できない" do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角ひらがなカタカナ漢字で")
  end
  
  it "ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力じゃないと登録できない" do
    @user.first_name = 'ｶｶｶｶ'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name 全角ひらがなカタカナ漢字で")
  end
  
  it "ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力じゃないと登録できない" do
    @user.last_name = 'ｶｶｶｶ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name 全角ひらがなカタカナ漢字で")
  end
  
  
  it "ユーザー本名のフリガナは、名字が入力されないと登録できない" do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カナ入力")
  end
  
  it "ユーザー本名のフリガナは、名前が入力されないと登録できない" do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank","Last name kana 全角カナ入力")
  end
  
  it "ユーザー本名（名字）のフリガナは、全角（カタカナ）での入力じゃないと登録できない" do
    @user.first_name_kana = 'ｶｶｶｶ'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana 全角カナ入力")
  end

  it "ユーザー本名（名前）のフリガナは、全角（カタカナ）での入力じゃないと登録できない" do
    @user.last_name_kana = 'ｶｶｶｶ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana 全角カナ入力")
  end
  
  it "生年月日がないと登録できない" do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end


  end
end

  