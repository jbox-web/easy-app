module EasyAPP
  module DataTablesHelper

    def datatables_translations
      data = {}
      data[:processing]     = t('datatables.processing')
      data[:search]         = t('datatables.search')
      data[:lengthMenu]     = t('datatables.lengthMenu')
      data[:info]           = t('datatables.info')
      data[:infoEmpty]      = t('datatables.infoEmpty')
      data[:infoFiltered]   = t('datatables.infoFiltered')
      data[:infoPostFix]    = t('datatables.infoPostFix')
      data[:loadingRecords] = t('datatables.loadingRecords')
      data[:zeroRecords]    = t('datatables.zeroRecords')
      data[:emptyTable]     = t('datatables.emptyTable')
      data[:paginate] = {}
      data[:paginate][:first]    = t('datatables.paginate.first')
      data[:paginate][:previous] = t('datatables.paginate.previous')
      data[:paginate][:next]     = t('datatables.paginate.next')
      data[:paginate][:last]     = t('datatables.paginate.last')
      data[:aria] = {}
      data[:aria][:sortAscending]  = t('datatables.aria.sortAscending')
      data[:aria][:sortDescending] = t('datatables.aria.sortDescending')
      data[:select] = {}
      data[:select][:rows]    = t('datatables.select.rows')
      # data[:select][:cells]   = t('datatables.select.cells')
      # data[:select][:columns] = t('datatables.select.columns')
      data[:buttons] = {}
      data[:buttons][:pageLength] = {}
      data[:buttons][:pageLength][:_]    = t('datatables.buttons.pageLength._')
      data[:buttons][:pageLength][:'-1'] = t('datatables.buttons.pageLength.-1')
      data
    end


    def datatables_for(id, opts = {}, &block)
      datatable = EasyAPP::DataTablePresenter.new(self, id, opts)
      yield datatable if block_given?
      datatable
    end


    def datatable_button_for(button)
      case button
      when 'email'
        { action: 'email',           text: icon('fa-envelope-o',     aligned: false), titleAttr: t('datatables.buttons.email') }
      when 'reset_selection'
        { action: 'reset_selection', text: icon('fa-check-square-o', aligned: false), titleAttr: t('datatables.buttons.reset_selection'), method: 'post' }
      when 'reset_filters'
        { action: 'reset_filters',   text: icon('fa-refresh',        aligned: false), titleAttr: t('datatables.buttons.reset_filters') }
      when 'csv'
        { extend: 'csv',   text: icon('fa-file-text-o',  aligned: false), titleAttr: t('datatables.buttons.csv') }
      when 'excel'
        { extend: 'excel', text: icon('fa-file-excel-o', aligned: false), titleAttr: t('datatables.buttons.excel') }
      when 'pdf'
        { extend: 'pdf',   text: icon('fa-file-pdf-o',   aligned: false), titleAttr: t('datatables.buttons.pdf') }
      when 'print'
        { extend: 'print', text: icon('fa-print',        aligned: false), titleAttr: t('datatables.buttons.print') }
      end
    end

  end
end
