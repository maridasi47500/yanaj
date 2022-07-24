class News < ApplicationRecord
def self.welcomepage
order(:created_at => :desc).limit(2)
end    
has_many :newshavetopics
has_many :topics, through: :newshavetopics

has_many :someothernews
has_many :othernews, through: :someothernews, source: :othernews
before_validation :saveurl
def saveurl
self.url=self.title.parameterize
end
def self.search(x)
s="%"+x.to_s.downcase.gsub(' ','%')+"%"
where('lower(title) like ? or lower(content) like ? or lower(excerpt) like ?',s,s,s)
end
def myurl
Rails.application.routes.url_helpers.mynews_path(title: title.parameterize, category: topics.first.try(:name))
end
def self.searchall(page,thematique)
page=page.to_i == 0 ? page.to_i : (page.to_i - 1)
mylimit=8
k=News.left_joins(:topics).select("news.*, (select cast(count(news.id)/#{mylimit} as int) from news) as nbnewspages, topics.url as topicurl,cast(count(distinct topics.url = '#{thematique}') as int) as counturl").limit(mylimit).offset((page.to_i*mylimit))
if thematique && thematique != "default" && thematique != "Toutes"
k.select("news.*, (select cast(count(n.id)/#{mylimit} as int) from news n left join newshavetopics ne on ne.news_id = n.id left join topics t on t.id = ne.topic_id group by n.id having cast(count(distinct t.url = '#{thematique}') as int) > 0) as nbnewspages").group('news.id').having("cast(count(distinct topicurl = ?) as int) > 0", thematique)
else
k
end
end


end