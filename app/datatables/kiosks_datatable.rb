class KiosksDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
    #@user = user



  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords:Kiosk.count,
      iTotalDisplayRecords: kiosks.total_entries,
      aaData: data
    }
  end

private

  def data
    kiosks.map do |kiosk|
      [
        #link_to(car.user.name, [@user, car]),data-toggle="modal" href="#myModal"
        h(kiosk.nombre),
        h(kiosk.precio),
        h(kiosk.created_at),
        link_to("portada" ,kiosk.portada(:original, false)),
        link_to("pdf",kiosk.pdf.url(:original, false)),
        link_to(" Edit", {action: :edit, id: kiosk}, :class=>"btn btn-mini btn-inverse icon-edit"),
        link_to(" Delete", [kiosk], method: :delete, confirm: "Estas seguro?", :class=>"btn btn-mini btn-danger icon-trash",:confirm=>"Are you sure? ")

      ]
    end
  end

  def kiosks
    @kiosks ||= fetch_kiosks
  end

  def fetch_kiosks
    kiosks = Kiosk.order("#{sort_column} #{sort_direction}")
    kiosks = kiosks.page(page).per_page(per_page)
    if params[:sSearch].present?
      kiosks = kiosks.where("nombre like :search or precio like :search or created_at like :search ", search: "%#{params[:sSearch]}%")
    end
    kiosks
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[nombre color model year]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end