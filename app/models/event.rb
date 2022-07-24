class Event < ApplicationRecord
has_many :eventshavetopics
has_many :topics, through: :eventshavetopics
before_validation :saveurl
has_many :eventshaveevents
has_many :otherevents, :through => :eventshaveevents, source: :otherevent
def saveurl
self.url=self.title.parameterize
end
def self.searchall(page)
page=page.to_i == 0 ? page.to_i : (page.to_i - 1)
ev=[]
date=Date.today
latest=Event.select("max(enddate) as max, strftime('%m', max(enddate)) as a")[0]
while date <= latest.max.to_date && date.month != latest.a.to_i do
    where("(cast(strftime('%Y', startdate) as int) <= cast(strftime('%Y', '#{date.to_s}') as int) and cast(strftime('%m', startdate) as int) <= cast(strftime('%m', '#{date.to_s}') as int)) and (cast(strftime('%m', enddate) as int) >= cast(strftime('%m', '#{date.to_s}') as int) and cast(strftime('%Y', enddate) as int) >= cast(strftime('%Y', '#{date.to_s}') as int))").map{|x|[I18n.l(date,format: :indexevent),x]}.each do |myev|
    ev.push(myev)
    end
    date= date.next_month
end
ev[(page.to_i*6),6] || []
end
def self.welcomepage
where("startdate >= ?",Date.today).order(:startdate).limit(1)
end    
def self.previousevents(page)
page.to_i > 0
end
def self.nextevents(page)
x=self.searchall(page.to_i + 1).map{|y|y[1]}.map{|y|y[1]}.flatten
x && x.length > 0
end

def self.search(x)
s="%"+x.to_s.downcase.gsub(' ','%')+"%"
where('lower(title) like ? or lower(content) like ?',s,s)
end
def myurl
Rails.application.routes.url_helpers.event_path(title: url)
end
def myeventstarttime
I18n.l(starttime,format: :long)
end
def myeventstartdate
I18n.l(startdate,format: :long)
end
def myeventendtime
I18n.l(endtime,format: :long)
end
def myeventenddate
I18n.l(enddate,format: :long)
end
def mydate
if !self.startdate
I18n.l(Date.today,format: :long)
 elsif self.startdate && startdate == enddate && endtime && starttime != endtime
myeventstartdate+", de "+myeventstarttime+" à "+myeventendtime
elsif self.startdate && startdate != enddate
"du "+myeventstartdate+" au "+myeventenddate

elsif self.startdate && startdate == enddate || !enddate
myeventstartdate

end
end

end