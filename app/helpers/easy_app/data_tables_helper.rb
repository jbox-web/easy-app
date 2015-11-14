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
      data[:buttons] = {}
      data[:buttons][:pageLength] = {}
      data[:buttons][:pageLength][:_]    = t('datatables.buttons.pageLength._')
      data[:buttons][:pageLength][:'-1'] = t('datatables.buttons.pageLength.-1')
      data
    end


    def datatables_for(id, opts = {}, &block)
      datatable = DataTablePresenter.new(self, id, opts)
      yield datatable if block_given?
      datatable
    end

  end
end
