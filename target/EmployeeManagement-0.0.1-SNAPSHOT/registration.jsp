
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content model-bg">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-white" id="exampleModalLabel">Employee Registration Form</h1>
        <a type="button" class="nav-link active" data-bs-dismiss="modal" aria-label="Close" style="color: white;">X</a>
      </div>
      <div class="modal-body">
       <form action="registerNow" method="post" >
		    	<div class="col-lg-12 mt-2">
		    		<input class="form-control" type="text" name="empName" placeholder="Enter Your Name">
		    	</div>
		    	<div class="col-lg-12 mt-2">
		    		<input class="form-control" type="text" name="empEmail" placeholder="Enter Your Email">
		    	</div>
		    	<div class="col-lg-12 mt-2">
		    		<input class="form-control" type="tel" max="10" min="10" maxlength="10" name="empContact" placeholder="Enter Your Contact">
		    	</div>
		    	<div class="col-lg-12 mt-2">
			    	<select class="form-select" name="empDepartment" aria-label="Default select example">
					  <option disabled="disabled" value="none" selected>Select your Department</option>
					  <option value="AWS & DevOps">AWS & DevOps</option>
					  <option value="Testing">Testing</option>
					  <option value="Development">Development</option>
					  <option value="Quality Assurance">Quality Assurance</option>
					  <option value="Database Management">Database Management</option>
					</select>
		    	
		    	
		    	</div>
		    	
		    	<div class="col-lg-12 mt-2">
		    		<input class="form-control" type="password" name="password" placeholder="Enter Your Password">
		    	</div>
		    	<div class="col-lg-12 mt-2">
		    		<button class="btn btn-outline-primary" type="submit">Register Now</button>
		    		<button class="btn btn-outline-secondary" type="reset">Reset</button>
		    	</div>
		    </form>
      </div>
    </div>
  </div>
</div>