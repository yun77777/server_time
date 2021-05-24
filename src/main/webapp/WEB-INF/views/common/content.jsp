 <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
     <!-- Page Content-->
        <!-- <section class="py-5">
            <div class="container">
                <h1 class="mb-4">Welcome to Modern Business</h1>
                Marketing Icons Section
                <div class="row">
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">Card Title</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Learn More</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4 mb-4 mb-lg-0">
                        <div class="card h-100">
                            <h4 class="card-header">Card Title</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Learn More</a></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card h-100">
                            <h4 class="card-header">Card Title</h4>
                            <div class="card-body"><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p></div>
                            <div class="card-footer"><a class="btn btn-primary" href="#!">Learn More</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->
        <hr class="my-0" />
        
        <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- Portfolio Section-->
        <section class="py-5 bg-light" style="float:left;width:80%;">
         <article>
	            <div class="container">
	                <h2 class="mb-4">NEW ARRIVAL</h2>
	                <div class="row">
	                    <div class="col-lg-4 col-sm-6 mb-4">
	                        <div class="card h-100">
	                            <a href="#!"><img class="card-img-top" src="<c:url value='/resources/assets/img/shirt.jpg'/>" alt="..." /></a>
	                            <div class="card-body">
	                                <h4 class="card-title"><a href="#!">White Shirt</a></h4>
	                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-sm-6 mb-4">
	                        <div class="card h-100">
	                            <a href="#!"><img class="card-img-top" src="<c:url value='/resources/assets/img/t-shirt.jpg'/>" alt="..." /></a>
	                            <div class="card-body">
	                                <h4 class="card-title"><a href="#!">T-shirt</a></h4>
	                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-sm-6 mb-4">
	                        <div class="card h-100">
	                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
	                            <div class="card-body">
	                                <h4 class="card-title"><a href="#!">Project Three</a></h4>
	                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <c:forEach var="result" items="${list}" varStatus="status">
		                   <div class="col-lg-4 col-sm-6 mb-4">
		                       <div class="card h-100">
		                           <a href="#!" onclick="fn_detail('${result.gdsNum}','${result.B_TYPE}')">
<%-- 		                           <a href="#!" onclick="fn_detail('${result.B_NO}','${result.B_TYPE}')"> --%>
		                           <img class="card-img-top" src="<c:url value='/img/${result.file}'/>" alt="no image" /></a>
		                           <input type="hidden" id="gdsNum" name="gdsNum">
<!-- 		                           <input type="hidden" id="B_NO" name="B_NO"> -->
		                           <input type="hidden" id="B_TYPE" name="B_TYPE">
		                       </div>
		                   </div>
	                    </c:forEach>
	                    
	                    <!-- <div class="col-lg-4 col-sm-6 mb-4">
	                        <div class="card h-100">
	                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
	                            <div class="card-body">
	                                <h4 class="card-title"><a href="#!">Project Five</a></h4>
	                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-sm-6 mb-4">
	                        <div class="card h-100">
	                            <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
	                            <div class="card-body">
	                                <h4 class="card-title"><a href="#!">Project Six</a></h4>
	                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
	                            </div>
	                        </div>
	                    </div> -->
	                </div>
	            </div>
           </article>
        </section>
        <aside style="float:left;width:20%">
        	<h3>최근글</h3> <ul> <li>목록1</li> <li>목록2</li> </ul>
        	
        	<div id="floatMenu" class="floatMenu" style="position: absolute;
			width: 200px;
			height: 200px;
			right: 50px;
			top: 550px;
			background-color: #606060;
			color: #fff;">
			<span>최근에 본 상품</span>
		</div>
        </aside>
        

        <hr class="my-0" />
        