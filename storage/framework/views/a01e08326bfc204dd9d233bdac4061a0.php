
<?php $__env->startSection('content'); ?>
<style>
    #myGrid {
        height: 850px;
        width: 100%;
    }
</style>
<div id="message"></div>

<div class="row mb-4">
    <div class="col-md-6">
        <button onclick="saveAll()" class="btn btn-success">Save All</button>
    </div>
    <div class="col-md-6 d-flex justify-content-end">
        <button onclick="addNewRow()" class="btn btn-primary">Add New</button>
    </div>
</div>

<div id="myGrid" class="ag-theme-alpine"></div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('customJs'); ?>
<script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>
<script>
    // Grid Options: Contains all of the Data Grid configurations
    let stockCounter = 1;
    const storeNames = <?php echo json_encode($store, 15, 512) ?>;
    const gridOptions = {
        // Row Data: The data to be displayed.
        rowData: [{
            ItemCode: "",
            ItemName: "",
            Quantity: "",
            Location: "",
            StoreName: "",
            InStockDate: new Date().toLocaleDateString('en-US')
        }],
        // Column Definitions: Defines the columns to be displayed.
        columnDefs: [{
                field: "ItemCode",
                editable: true,
            },
            {
                field: "ItemName",
                editable: true
            },
            {
                field: "Quantity",
                editable: true
            },
            {
                field: "Location",
                editable: true
            },
            {
                field: "StoreName",
                editable: true,
                cellEditor: 'agSelectCellEditor',
                cellEditorParams: {
                    values: storeNames,
                },
            },
            {
                field: "InStockDate",
                editable: true
            }
        ],
        defaultColDef: {
            flex: 1,
            resizable: true
        },
        onGridReady: function(params) {
            gridOptions.api = params.api;
        }
    };
    const myGridElement = document.querySelector('#myGrid');
    agGrid.createGrid(myGridElement, gridOptions);

    // Function to Add New Row
    function addNewRow() {
        const newRow = {
            StockNo: "", // Auto-increment stock number
            ItemCode: "",
            ItemName: "",
            Quantity: "",
            Location: "",
            StoreName: "",
            InStockDate: ""
        };

        gridOptions.api.applyTransaction({
            add: [newRow]
        });
    }

    // Function to Save All Rows
    function saveAll() {
        const submitdData = [];
        gridOptions.api.forEachNode(node => {
            submitdData.push(node.data);
        });
        if (confirm('Are you sure you want to save all record?')) {
            $.ajax({
                type: 'post',
                url: '<?php echo e(url("/api/stock-save")); ?>',
                headers: {
                    "Authorization": "Bearer " + AuthToken
                },
                data: {
                    data: submitdData,
                },
                success: function(response, status, xhr) {
                    if (xhr.status === 200) {
                        $("#message").html('<div class="alert alert-success" role="alert"> Record deleted successfully!</div>');

                        //redirect on stock list
                        setTimeout(() => {
                            //window.location.href = "<?php echo e(route('stock.list')); ?>";
                        }, 1000);
                        //\redirect on stock list
                    } else {
                        $("#message").html('<div class="alert alert-danger" role="alert"> Faild to delete record!</div>');
                    }
                },
                error: function(xhr, textStatus, errorThrown) {
                    if (xhr.status === 401) {
                        alert("Your session has expired. Please log in again.");
                        window.location.href = "<?php echo e(route('auth.login')); ?>";
                    }
                }
            });
        }
    }
</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('master-layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH H:\WebApps\htdocs\DKInfoway\resources\views/stock/add.blade.php ENDPATH**/ ?>