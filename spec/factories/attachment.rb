FactoryGirl.define do
  factory :attachment do
    guid { 'd119a996-f95b-4f7f-95b0-74df6dabdfd1' }
    create_date_time { DateTime.parse("2013-03-05T16:29:08") }
    file_name { 'Проект договора на поставку дорожных знаков.docx' }
    description { 'Проект договора на поставку дорожных знаков' }
    url { 'http://zakupki.gov.ru/223/purchase/public/download/download.html?id=732754' }
  end
end
