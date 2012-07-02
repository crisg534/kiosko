$ ->
#Start dataTable Kiosks
  $('#kiosks').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: false
    bFilter: false
    sDom: "<'row-fluid'<'span6'T><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    sAjaxSource: $('#kiosks').data('source')
    oLanguage:
      sProcessing: "<i class='icon-refresh'>"
      sLengthMenu: "Mostrar _MENU_ registros"
      sZeroRecords: "No se encontraron resultados"
      sInfo: "Mostrando desde _START_ hasta _END_ de _TOTAL_ registros"
      sInfoEmpty: "Mostrando desde 0 hasta 0 de 0 registros"
      sInfoFiltered: "(filtrado de _MAX_ registros en total)"
      sInfoPostFix: ""
      sSearch: "Buscar:"
      sUrl: ""
      oPaginate:
        sFirst: "Primero"
        sPrevious: "Anterior"
        sNext: "Siguiente"
        sLast: "Último"

  $("select[name=kiosks_length]").css "display", "inline"
  $("select[name=kiosks_length]").css "width", "auto"
  $("#kiosks_filter").children().children("input[type=text]").css "display", "inline"
  $("#kiosks_filter").children().children("input[type=text]").css "width", "auto"
  #End dataTable Kiosks
