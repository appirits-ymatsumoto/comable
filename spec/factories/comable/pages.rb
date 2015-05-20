FactoryGirl.define do
  factory :page, class: Comable::Page do
    title 'page'
    content 'content'
    page_title 'page'
    meta_description 'meta_description'
    meta_keywords 'keyword1,keyword2'
    slug 'page'
    published_at Time.now
  end
end
