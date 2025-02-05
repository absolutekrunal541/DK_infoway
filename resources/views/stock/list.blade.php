@extends('master-layout')

@section('customCss')
<!-- DataTables CSS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
@endsection

@section('content')
<div class="card mt-2">
    <div class="card-header">

        <div class="row">
            <div class="col-md-6">
                <h5>Stocks List</h5>
            </div>
            <div class="col-md-6" align="right">
                <a href="{{route('stock.add')}}"> Add New</a>
            </div>
        </div>
    </div>
    <div class="card-body">
        <div id="message"></div>
        <table class="table table-bordered" id="list-table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Store </th>
                    <th scope="col">Item Code</th>
                    <th scope="col">Item Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Location</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action </th>
                </tr>
            </thead>
        </table>
    </div>
    @endsection

    @section('customJs')
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(function() {
            var table = $('#list-table').DataTable({
                stateSave: false,
                responsive: true,
                processing: true,
                serverSide: true,
                searching: true,
                lengthMenu: [20, 50, 100],
                ajax: {
                    url: "{{ url('/api/stock-list') }}",
                    headers: {
                        "Authorization": "Bearer " + AuthToken
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        if (xhr.status === 401) {
                            alert("Your session has expired. Please log in again.");
                            window.location.href = "{{route('auth.login')}}";
                        }
                    }

                },
                columns: [{ // Sr. No. column
                        data: null,
                        name: 'sr_no',
                        searchable: false,
                        orderable: false
                    },
                    {
                        data: 'store_name',
                        name: 'store_name'
                    },
                    {
                        data: 'item_code',
                        name: 'item_code'
                    },
                    {
                        data: 'item_name',
                        name: 'item_name'
                    },
                    {
                        data: 'quantity',
                        name: 'quantity'
                    },
                    {
                        data: 'location',
                        name: 'location'
                    },
                    {
                        data: 'status',
                        name: 'status'
                    },
                    {
                        data: 'id',
                        name: 'id'
                    }
                ],
                columnDefs: [{
                        "targets": [0],
                        "width": "50px",
                        "class": "text-center",
                        "render": function(data, type, row, meta) {
                            return meta.row + 1;
                        }
                    },
                    {
                        "targets": [6],
                        "width": "50px",
                        "class": "text-center",
                        "render": function(data, type, row, meta) {
                            if (data == 1) {
                                return "<span class='badge badge-success'>In-Stock</span>";
                            } else {
                                return "<span class='badge badge-danger'>Out of Stock</span>";
                            }
                        }
                    },
                    {
                        "targets": [7],
                        "width": "200px",
                        "class": "text-center",
                        "render": function(data, type, row, meta) {
                            var action = '<a href="#" title="Delete" class="deleteStock" data-id="' + row['id'] + '"> Delete </a>';
                            return action.replaceAll(':id', row['id']);
                        }
                    }
                ]
            });

            //delete data 
            table.on('click', '.deleteStock', function(e) {
                e.preventDefault();
                var delId = $(this).data('id');
                var url = '{{ url("/api/stock-delete/:id") }}'.replace(':id', delId);
                if (confirm('Are you sure you want to delete this record?')) {
                    $.ajax({
                        type: 'Delete',
                        url: url,
                        headers: {
                            "Authorization": "Bearer " + AuthToken
                        },
                        success: function(response, status, xhr) {
                            if (xhr.status === 200) {
                                $("#message").html('<div class="alert alert-success" role="alert"> Record deleted successfully!</div>');

                                //reload table
                                table.ajax.reload();
                            } else {
                                $("#message").html('<div class="alert alert-danger" role="alert"> Faild to delete record!</div>');
                            }
                        }
                    });
                }
            });
            //\\delete data 
        });
    </script>
    @endsection