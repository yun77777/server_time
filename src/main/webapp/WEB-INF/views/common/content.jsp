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
        <section class="py-5 bg-light">
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
	                           <a href="#!">
	                           <img class="card-img-top" src="<c:url value='/img/${result.file}'/>" alt="no image" /></a>
<%-- 	                           <a href="#!"><img class="card-img-top" src="/displayImages.do?file_no=${result.file_no}" alt="no image" /></a> --%>
	                           <div class="card-body">
	                           <input type="hidden" id="id" name="B_NO" value="${result.B_NO}">
	                           <input type="hidden" id="B_TYPE" name="B_TYPE" value="${result.B_TYPE}">
	                           
	                               <h4 class="card-title"><a href="#!" onclick="fn_detail()">${result.title}</a></h4>
	                               <p class="card-text">${result.content}</p>
	                               <p class="card-text">${result.file}</p>
	                               <p class="card-text">${result.file_src}</p>
	                               <p class="card-text">${result.file_no}</p>
	                               <p class="card-text">${result.B_NO}</p>
	                           </div>
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
        </section>
        <hr class="my-0" />
        
         <!-- Features Section-->
        <!-- <section class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <h2 class="mb-4">Modern Business Features</h2>
                        <p>The Modern Business template by Start Bootstrap includes:</p>
                        <ul>
                            <li><strong>Bootstrap 4.6.0</strong></li>
                            <li>jQuery 3.5.1</li>
                            <li>Font Awesome 5.15.3</li>
                            <li>Working PHP contact form with validation</li>
                            <li>Unstyled page elements for easy customization</li>
                        </ul>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia dolorum ducimus unde.</p>
                    </div>
                    <div class="col-lg-6"><img class="img-fluid rounded" src="https://via.placeholder.com/700x450" alt="..." /></div>
                </div>
            </div>
        </section>
        <hr class="my-0" /> -->
        <!-- Call to Action-->
        <!-- <aside class="py-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-8"><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p></div>
                    <div class="col-md-4"><a class="btn btn-lg btn-secondary btn-block" href="#!">Call to Action</a></div>
                </div>
            </div>
        </aside> -->