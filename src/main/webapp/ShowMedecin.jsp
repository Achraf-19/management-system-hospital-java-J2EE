<%@page import="Ado.Medecin.Medecin"%>
<%@page import="java.util.List"%>
<%@page import="Ado.Medecin.CMedecinImp"%>
<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
<style>
    .modal-header {
       background: #5cb377;
       color: #fff;
    }
</style>
<%@include file="includes/header.jsp" %>
 <div class="app-wrapper">
 <script type="text/javascript">
	$(document).ready(function() {
		$('#tabledata').DataTable();
		$('.editbtn').on('click',function(){
			$tr=$(this).closest('tr');
			var data=$tr.children("td").map(function(){
				return $(this).text();
			}).get();
			console.log(data);
			$('#nom').val(data[0]);
			$('#prenom').val(data[1]);
			$('#email').val(data[2]);
			$('#adresse').val(data[3]);
			$('#telephone').val(data[4]);
			$('#status').val(data[5]);
		});
	});
</script>
	  <div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-12">
				<h2 class="text-center text-success p-3 m-1">LISTE MEDCIN</h2>
				<table id="tabledata" class="table" >
				  <thead>
				    <tr class="table-info">
				      <th scope="col">Nom</th>
				      <th scope="col">Prenom</th>
				      <th scope="col">Email</th>
				      <th scope="col">Adresse</th>
				      <th scope="col">Telephone</th>
				      <th scope="col">Status</th>
				       <th class="text-center" scope="col">UPDATE</th>
				      <th class="text-center" scope="col">VUE</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  		CMedecinImp cm=new CMedecinImp();
				  		List<Medecin> lm=cm.getAllMedecin();
				  		for(Medecin md:lm){
				  %>
				    <tr>
				      <td><%= md.getNom() %></td>
				      <td><%= md.getprenom() %></td>
				      <td><%= md.getEmail() %></td>
				      <td><%= md.getAdresse() %></td>
				      <td><%= md.getTelephone() %></td>
				      <td><%= md.getStatus() %></td>
				      <td><a class="btn btn-warning text-dark" href='pages/updateMedcin.jsp?id=<%= md.getId()  %>'><i class="fas fa-edit"></i></a></td>
				      <td><a href='?idmedecin=<%= md.getId() %>' class="btn btn-secondary text-dark editbtn" data-bs-toggle="modal" data-bs-target="#myModal"><i class="fas fa-eye"></i></a></td>
				    </tr>
				    <% } %>
				  </tbody>
				</table>
			</div>
		</div>
		<div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-white">Information de Medecin</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="mb-2">
                                <label class="form-label required">Nom</label>
                                <input type="text" class="form-control" id="nom" readonly>
                            </div>
                            <div class="mb-2">
                                <label class="form-label required">Prenom</label>
                                <input type="text" class="form-control" id="prenom" readonly>
                            </div>
                            <div class="mb-2">
                                <label class="form-label required">Email</label>
                                <input type="email" class="form-control" id="email" readonly>
                            </div>
                            <div class="mb-2">
                                <label class="form-label required">Adresse</label>
                                <input type="text" class="form-control" id="adresse" readonly>
                            </div>
                            <div class="mb-2">
                                <label class="form-label required">Telephone</label>
                                <input type="text" class="form-control" id="telephone" readonly>
                            </div>
                            <div class="mb-2">
                                <label class="form-label required">Status</label>
                                <input type="text" class="form-control" id="status" readonly>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
	</div> 
</div> 
<%@include file="includes/footer.jsp" %>
<% }else{
        response.sendRedirect("login.jsp");
    } 
%>