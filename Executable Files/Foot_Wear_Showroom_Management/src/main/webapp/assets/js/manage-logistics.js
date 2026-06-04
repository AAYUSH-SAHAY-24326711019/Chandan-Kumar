/**
 * 
 */

let currentPage = 1;

$(document).ready(function () {

    loadStatuses();
    loadLogistics();

    $("#searchBox").keyup(function () {
        currentPage = 1;
        loadLogistics();
    });

});

function loadStatuses() {

    $.ajax({

        url: "logistics",
        type: "GET",
        data: {
            action: "statuses"
        },

        success: function (data) {

            $("#statusId").html(
                '<option value="">Select Status</option>'
            );

            $("#editStatus").html(
                '<option value="">Select Status</option>'
            );

            $.each(data, function (i, item) {

                $("#statusId").append(
                    `<option value="${item.id}">
                        ${item.contractStatus}
                     </option>`
                );

                $("#editStatus").append(
                    `<option value="${item.id}">
                        ${item.contractStatus}
                     </option>`
                );

            });
        }

    });
}

function loadLogistics() {

    $.ajax({

        url: "logistics",

        type: "GET",

        data: {

            action: "list",
            page: currentPage,
            search: $("#searchBox").val()

        },

        success: function (response) {

            let rows = "";

            $.each(response.data, function (i, item) {

                rows += `
                <tr>

                    <td>${item.id}</td>

                    <td>${item.logisticCompany}</td>

                    <td>${item.contractStart}</td>

                    <td>${item.contractEndDate}</td>

                    <td>${item.statusName}</td>

                    <td>

                        <button
                            class="btn btn-sm btn-warning"
                            onclick="editRecord(${item.id})">

                            Edit

                        </button>

                        <button
                            class="btn btn-sm btn-danger"
                            onclick="deleteRecord(${item.id})">

                            Delete

                        </button>

                    </td>

                </tr>
                `;
            });

            $("#tableBody").html(rows);

            generatePagination(response.total);
        }

    });

}

function generatePagination(totalRecords) {

    let limit = 10;

    let pages =
        Math.ceil(totalRecords / limit);

    let html = "";

    for (let i = 1; i <= pages; i++) {

        html += `
        <button
            class="btn btn-sm btn-secondary m-1"
            onclick="gotoPage(${i})">

            ${i}

        </button>
        `;
    }

    $("#pagination").html(html);
}

function gotoPage(page) {

    currentPage = page;

    loadLogistics();
}

function validateForm() {

    let company =
        $("#logisticCompany").val().trim();

    let regex =
        /^[A-Za-z0-9 .,&()-]{2,100}$/;

    if (!regex.test(company)) {

        alert("Invalid company name");

        return false;
    }

    let start =
        $("#contractStart").val();

    let end =
        $("#contractEndDate").val();

    if (start > end) {

        alert(
            "End date cannot be before start date"
        );

        return false;
    }

    return true;
}

$("#logisticForm").submit(function (e) {

    e.preventDefault();

    if (!validateForm()) {
        return;
    }

    $.ajax({

        url: "logistics",

        type: "POST",

        data: {

            action: "add",

            logisticCompany:
                $("#logisticCompany").val(),

            contractStart:
                $("#contractStart").val(),

            contractEndDate:
                $("#contractEndDate").val(),

            statusId:
                $("#statusId").val()
        },

        success: function (response) {

            if (response === "success") {

                $("#logisticForm")[0].reset();

                loadLogistics();

                alert("Saved Successfully");
            }
        }
    });
});


function deleteRecord(id) {

    if (!confirm(
        "Delete this record?"
    )) {
        return;
    }

    $.ajax({

        url: "logistics",

        type: "POST",

        data: {

            action: "delete",
            id: id
        },

        success: function (response) {

            if (response === "success") {

                loadLogistics();

                alert("Deleted Successfully");
            }
        }

    });
}

function editRecord(id) {

    $.ajax({

        url: "logistics",

        type: "GET",

        data: {

            action: "getById",
            id: id
        },

        success: function (item) {

            $("#editId").val(item.id);

            $("#editCompany").val(
                item.logisticCompany
            );

            $("#editStart").val(
                item.contractStart
            );

            $("#editEnd").val(
                item.contractEndDate
            );

            $("#editStatus").val(
                item.statusId
            );

            let modal =
                new bootstrap.Modal(
                    document.getElementById(
                        "editModal"
                    )
                );

            modal.show();
        }

    });
}

$("#updateBtn").click(function () {

    $.ajax({

        url: "logistics",

        type: "POST",

        data: {

            action: "update",

            id:
                $("#editId").val(),

            logisticCompany:
                $("#editCompany").val(),

            contractStart:
                $("#editStart").val(),

            contractEndDate:
                $("#editEnd").val(),

            statusId:
                $("#editStatus").val()
        },

        success: function (response) {

            if (response === "success") {

                bootstrap.Modal
                    .getInstance(
                        document.getElementById(
                            "editModal"
                        )
                    )
                    .hide();

                loadLogistics();

                alert(
                    "Updated Successfully"
                );
            }
        }

    });
});

