class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    #judge_event_time
    @event.event_time = construct_event_time(current_manager)
    @event.manager_id = params[:manager_id]
    @event.event_type = params[:event_type]
    # binding.pry
    if @event.save
      Information.create(info_header: "一般社団法人ツナグコトさんがイベントを新しく投稿しました。

        ")
      redirect_to root_path
    else
    end
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private 
    def event_params
       params.require(:event).permit(:event_name, :event_time, :event_place, :event_cost, :event_type, :event_belongings, :event_detail, :manager_id)
    end
    #form_tagの場合は上記のrequire(:event)はいらない、
    #form_forはモデルに元ずいてハッシュを作るので、１回eventモデルを呼び出す必要があった。

    def judge_event_time
      month = params[:event]['event_time(2i)']#月
      day = params[:event]['event_time(3i)']#日 
      mon = [2,4,6,9,11]
      mon.each do |m|     
        if month == m && day ==31
          redirect_to new_manager_event_path(manager_id: current_manager.id)
        else
          true
        end
      end
    end

    def construct_event_time(manager)

      year = params[:event]['event_time(1i)']#年
      month = params[:event]['event_time(2i)']#月
      day = params[:event]['event_time(3i)']#日
      hour = params[:event]['event_time(4i)']#時
      min = params[:event]['event_time(5i)']#分
      #返り値
      begin
        DateTime.new(year.to_i, month.to_i, day.to_i, hour.to_i, min.to_i)
      rescue ArgumentError
        flash[:notice] = "※日付けが正しくありません"
       redirect_to new_manager_event_path(manager_id: manager.id) and return
      end
    end
end
