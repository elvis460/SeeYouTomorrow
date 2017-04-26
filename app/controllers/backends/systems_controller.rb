class Backends::SystemsController < BackendsController
  def edit
    render layout: false
  end

  def update
    @system.update(system_params_permit)
    redirect_to :back,flash: { success: '更新成功'}
  end

  def file_upload
    
  end

  def import_passenger_excel
    require 'roo'

    params[:file].each do |file|
      @external_file = ExternalFile.new
      @external_file.file = file
      @external_file.save
      file_url = File.join(Rails.public_path,@external_file.file.url)
      @excel = Roo::Excelx.new(file_url , extension: :xlsx)
      
      (2..@excel.column(0).length).each do |passenger|
        @passenger = PassengerInfo.new
        @passenger.psgr_no =  @excel.cell(passenger,'A')
        @passenger.name =  @excel.cell(passenger,'B')
        @passenger.major =  @excel.cell(passenger,'C')
        # colume D is facebook
        @passenger.email =  @excel.cell(passenger,'E')
        
        #tags
        if @excel.cell(passenger,'F') != nil
          @excel.cell(passenger,'F').split(' #').reject(&:empty?).each do |tag|

            @tag = Tag.create(content: tag)
            if @tag.save
              @passenger.tag_id << @tag.id
            else
              # not to save duplicate value (validate in model) and just add the tag_id
              @passenger.tag_id << Tag.find_by(content: tag).id
            end
          end
        end
        @passenger.save  
      end
    end

    redirect_to backends_passengerinfos_path ,flash: { success: '乘客資訊載入成功'}
  end

  private
  def system_params_permit
    params.require(:system).permit(:name, :title, :description, :keyword, :phone,:fax, :address, :email,:facebook)
  end
end
