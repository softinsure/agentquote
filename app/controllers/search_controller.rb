class SearchController < ApplicationController
  require 'ostruct'
    def index
      @query = 'select * from users'
      @countquery ='select count(*) from users'
      #@query =params[:search][:query]
      #@countquery =params[:search][:countquery]
      @count  =select_value(@countquery)
      @results =select_all(@query)
    
     respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => {"count"=>@count,"rows"=>@results}}
      format.xml  { render :xml => {"rows"=>@results,"rowcount"=>@count}}
     end
  end
     def create
      ##@query = 'select * from users where login like "q%"'
      @query =params[:search][:query]
      @countquery =params[:search][:countquery]
      @count  =select_value(@countquery)
      @results =select_all(@query)
    
     respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => {"rows"=>@results,"rowcount"=>@count}}
     end
  end
    def select_all(query)
        rows=ActiveRecord::Base.connection.select_all(query)
        #rows.map! do |row|
        #  row = OpenStruct.new(row)
        #  table = row.send(:table)
        #  table.each {|k, v| table[k] = select_type_cast(v) }
        #  row
        #end
        rows
      end
      def select_one(query)
        select_all(query).first
      end
      def select_value(query)
        select_type_cast(ActiveRecord::Base.connection.select_value(query))
      end
      def select_type_cast(v)
        return unless v
        if md = v.match(/^(\d{4})-(\d{2})-(\d{2})$/)
          Date.new(*md.captures.map(&:to_i)) rescue v
        elsif md = v.match(/^(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/)
          Time.local(*md.captures.map(&:to_i)) rescue v
        elsif v =~ /^\d+$/
          v.to_i
        elsif v =~ /^\d+(?:\.\d+)+$/
          v.to_f
        else
          v
        end
      end
end
