<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Items</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial;
}

body{
    background:#f4f6f9;
    padding:40px;
}

.container{
    max-width:900px;
    margin:auto;
}

.title{
    font-size:32px;
    margin-bottom:20px;
    font-weight:bold;
}

.form-box{
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}

.form-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
}

.form-group{
    display:flex;
    flex-direction:column;
}

.form-group label{
    margin-bottom:8px;
    font-weight:bold;
}

.form-group input,
.form-group select{
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
}

.image-preview{
    margin-top:25px;
    border:2px dashed #ccc;
    border-radius:10px;
    height:300px;
    overflow:hidden;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#fafafa;
}

.image-preview img{
    width:100%;
    height:100%;
    object-fit:contain;
}

.submit-btn{
    width:100%;
    margin-top:20px;
    padding:15px;
    border:none;
    background:#1f6feb;
    color:white;
    font-size:16px;
    border-radius:10px;
    cursor:pointer;
}

.submit-btn:hover{
    background:#1257c7;
}

</style>

</head>
<body>

<div class="container">

    <h1 class="title">Add Items</h1>

    <div class="form-box">

        <form action="add-items" method="post" enctype="multipart/form-data">

            <div class="form-grid">

                <div class="form-group">
                    <label>Item Name</label>

                    <input type="text"
                           name="item_name"
                           required>
                </div>

                <div class="form-group">

                    <label>Item Size</label>

                    <select name="item_size" required>

                        <option value="">Select Size</option>

                        <%

                        try{

                            Class.forName("org.postgresql.Driver");

                            Connection conn =
                            DriverManager.getConnection(
                            "jdbc:postgresql://localhost:5432/footwearshowroom",
                            "postgres",
                            "root"
                            );

                            String sql =
                            "select id, foot_wear_size from item_size";

                            PreparedStatement ps =
                            conn.prepareStatement(sql);

                            ResultSet rs = ps.executeQuery();

                            while(rs.next()){

                        %>

                            <option value="<%= rs.getInt("id") %>">

                                <%= rs.getString("foot_wear_size") %>

                            </option>

                        <%

                            }

                            conn.close();

                        }catch(Exception e){

                            out.println(e);

                        }

                        %>

                    </select>

                </div>

                <div class="form-group">

                    <label>Quantity</label>

                    <input type="number"
                           name="quantity"
                           required>

                </div>

                <div class="form-group">

                    <label>Price</label>

                    <input type="number"
                           step="0.01"
                           name="price"
                           required>

                </div>

                <div class="form-group"
                     style="grid-column:1/-1;">

                    <label>Upload Image</label>

                    <input type="file"
                           name="item_image"
                           id="item_image"
                           accept="image/*"
                           required>

                </div>

            </div>

            <div class="image-preview">

                <img id="previewImage"
                     src="https://placehold.co/600x300?text=Preview">

            </div>

            <button class="submit-btn">

                Store In Inventory

            </button>

        </form>

    </div>

</div>

<script>

const imageInput =
document.getElementById("item_image");

const previewImage =
document.getElementById("previewImage");

imageInput.addEventListener("change", function(e){

    const file = e.target.files[0];

    if(file){

        const reader = new FileReader();

        reader.onload = function(event){

            previewImage.src = event.target.result;

        };

        reader.readAsDataURL(file);

    }

});

</script>

</body>
</html>