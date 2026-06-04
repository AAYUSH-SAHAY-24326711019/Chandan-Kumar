<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Logistics</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>

body{
    background:#f8f9fa;
}

.card{
    box-shadow:0 2px 8px rgba(0,0,0,0.1);
}

.table-responsive{
    min-height:500px;
}

</style>

</head>
<body>

<div class="container-fluid mt-4">

    <div class="row">

        <!-- LEFT FORM -->

        <div class="col-md-4">

            <div class="card">

                <div class="card-header">
                    <h5>Add Logistic Company</h5>
                </div>

                <div class="card-body">

                    <form id="logisticForm">

                        <div class="mb-3">
                            <label class="form-label">
                                Logistic Company
                            </label>

                            <input type="text"
                                   class="form-control"
                                   id="logisticCompany"
                                   required>
                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Contract Start
                            </label>

                            <input type="date"
                                   class="form-control"
                                   id="contractStart"
                                   required>
                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Contract End
                            </label>

                            <input type="date"
                                   class="form-control"
                                   id="contractEndDate"
                                   required>
                        </div>

                        <div class="mb-3">

                            <label class="form-label">
                                Contract Status
                            </label>

                            <select class="form-select"
                                    id="statusId">

                                <option value="">
                                    Select Status
                                </option>

                            </select>

                        </div>

                        <button type="submit"
                                class="btn btn-primary w-100">

                            Save
                        </button>

                    </form>

                </div>
            </div>

        </div>

        <!-- RIGHT TABLE -->

        <div class="col-md-8">

            <div class="card">

                <div class="card-header">

                    <div class="row">

                        <div class="col-md-6">
                            <h5>Logistics List</h5>
                        </div>

                        <div class="col-md-6">

                            <input type="text"
                                   class="form-control"
                                   id="searchBox"
                                   placeholder="Search Company Name">

                        </div>

                    </div>

                </div>

                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-bordered table-hover">

                            <thead>

                            <tr>
                                <th>ID</th>
                                <th>Company</th>
                                <th>Start</th>
                                <th>End</th>
                                <th>Status</th>
                                <th width="130">
                                    Actions
                                </th>
                            </tr>

                            </thead>

                            <tbody id="tableBody">

                            </tbody>

                        </table>

                    </div>

                    <div id="pagination"
                         class="mt-3 text-center">

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<!-- EDIT MODAL -->

<div class="modal fade"
     id="editModal">

    <div class="modal-dialog">

        <div class="modal-content">

            <div class="modal-header">

                <h5>Edit Logistic Company</h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body">

                <input type="hidden"
                       id="editId">

                <div class="mb-3">

                    <label>
                        Company
                    </label>

                    <input type="text"
                           id="editCompany"
                           class="form-control">

                </div>

                <div class="mb-3">

                    <label>
                        Contract Start
                    </label>

                    <input type="date"
                           id="editStart"
                           class="form-control">

                </div>

                <div class="mb-3">

                    <label>
                        Contract End
                    </label>

                    <input type="date"
                           id="editEnd"
                           class="form-control">

                </div>

                <div class="mb-3">

                    <label>
                        Status
                    </label>

                    <select id="editStatus"
                            class="form-select">

                    </select>

                </div>

            </div>

            <div class="modal-footer">

                <button class="btn btn-primary"
                        id="updateBtn">

                    Update
                </button>

            </div>

        </div>

    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/manage-logistics.js"></script>

</body>
</html>