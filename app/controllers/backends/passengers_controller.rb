# 初期規劃：用作乘客擺渡紀錄建檔
# 後來加入需求：乘客基本資料含tag，由於db中已有passenger資料
#修正耗時，於是固定此controller為擺渡紀錄，新增PassengerInfo controller為乘客資料
class Backends::PassengersController < BackendsController
  
  before_action :find_passenger,except: [:index]

  def index
    @passengers = Passenger.all
  end

  def new
    render layout: false
  end

  def create
    @passenger = current_user.passengers.new(passenger_params_permit)
    if @passenger.save
      redirect_to backends_passengers_path, flash: { success: '新增成功'}
    else
      redirect_to backends_passengers_path, flash: { error: '新增失敗'}
    end
  end

  def edit
    
  end

  def update
    @passenger.update(passenger_params_permit)  
    redirect_to backends_passengers_path, flash: { success: '修改成功'}
  end

  def destroy
    @passenger.destroy
    redirect_to backends_passengers_path, flash: { success: '刪除成功'}
  end

  private

  def passenger_params_permit
    params.require(:passenger).permit(:name, :gender, :major, :email, :facebook, :date, :location)
  end

  def find_passenger
    @passenger = Passenger.find_by(id: params[:id]) ? Passenger.find_by(id: params[:id]) : Passenger.new
  end
end
