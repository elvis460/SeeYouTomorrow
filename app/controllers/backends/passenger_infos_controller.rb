class Backends::PassengerInfosController < BackendsController
  def index

    @passenger_infos = PassengerInfo.all.map do |passenger|
      {psgr_no: passenger.psgr_no, name: passenger.name, major: passenger.major, email: passenger.email,
       tags: passenger.tag_id.map do |tag|
        Tag.find(tag).content
       end
      }
      end
      
    @passenger_infos = JSON.parse(@passenger_infos.to_json)      
  end

  # TODO: edit tag
  def edit
    @passenger_info = PassengerIngo.find_by(id: params[:id])
  end

  def update
    @passenger_info.update(passenger_info_params_permit)  
    redirect_to backends_passengerinfos_path , flash: { success: '修改成功'}
  end

  private

  def passenger_info_params_permit
    params.require(:passenger).permit(:name, :major, :email, :tag_id)
  end

  def find_passenger

  end
end
