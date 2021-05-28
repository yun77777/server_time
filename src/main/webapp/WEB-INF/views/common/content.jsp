
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
<section class="py-5 bg-light" style="float: left; width: 80%;">
	<article>
		<div class="container">
			<h2 class="mb-4">NEW ARRIVAL</h2>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a href="#!"><img class="card-img-top"
							src="<c:url value='/resources/assets/img/shirt.jpg'/>" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#!">White Shirt</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Amet numquam aspernatur eum quasi sapiente
								nesciunt? Voluptatibus sit, repellat sequi itaque deserunt,
								dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a href="#!"><img class="card-img-top"
							src="<c:url value='/resources/assets/img/t-shirt.jpg'/>"
							alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#!">T-shirt</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipiscing elit. Nam viverra euismod odio, gravida pellentesque
								urna varius vitae.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a href="#!"><img class="card-img-top"
							src="https://via.placeholder.com/700x400" alt="..." /></a>
						<div class="card-body">
							<h4 class="card-title">
								<a href="#!">Project Three</a>
							</h4>
							<p class="card-text">Lorem ipsum dolor sit amet, consectetur
								adipisicing elit. Quos quisquam, error quod sed cumque, odio
								distinctio velit nostrum temporibus necessitatibus et facere
								atque iure perspiciatis mollitia recusandae vero vel quam!</p>
						</div>
					</div>
				</div>

				<c:forEach var="result" items="${list}" varStatus="status">
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="card h-100">
							<%-- <button type="button" onclick="fn_detail_pop('${result.gdsNum}')"
								class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModalLong">${result.gdsName}</button> --%>
							<a href="#!"
								onclick="fn_detail_pop('${result.gdsNum}')" data-toggle="modal"
								data-target="#exampleModalLong">
								<%-- 		                           <a href="#!" onclick="fn_detail('${result.B_NO}','${result.B_TYPE}')"> --%>
								<img class="card-img-top"
								src="<c:url value='/img/${result.representative_file}'/>"
								alt="no image" />
							</a>
							<div class="card-body">
								<h4 class="card-title">
									<a onclick="fn_detail('${result.gdsNum}','${result.B_TYPE}')"
								data-toggle="modal"
								data-target="#exampleModalLong">${result.gdsName}</a>
								</h4>
								<!-- <p class="card-text"></p> -->
							</div>
							<input type="hidden" id="gdsNum" name="gdsNum">
							<!-- 		                           <input type="hidden" id="B_NO" name="B_NO"> -->
							<input type="hidden" id="B_TYPE" name="B_TYPE"> <input
								type="hidden" id="currentPageNo" name="currentPageNo"
								value="${pg.currentPageNo}" /> <input type="hidden"
								id="recordCountPerPage" name="recordCountPerPage"
								value="${pg.recordCountPerPage}" />
						</div>
					</div>
				</c:forEach>



				<%-- <%@ include file="/WEB-INF/views/common/popup/itemDetailPopup.jsp" %>
 --%>
				<!-- Modal -->
				<div class="modal fade bd-example-modal-lg" id="exampleModalLong"
					tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Modal
									title</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="orderForm" method="post" enctype="multipart/form-data">
									<input type="hidden" name="gdsNum" value="${detail.gdsNum}" />
									<input type="hidden" name="userId" value="${member.ID}" />
									<%-- <input type="hidden" id="gdsNum" name="gdsNum" value="${detail.gdsNum}" />
				<input type="hidden" name="gdsPrice" value="${detail.gdsPrice}" />
				<input type="hidden" id="gdsStock" name="gdsStock" /> --%>
								
								</form>

					
								<table class="table">
									<thead>
									</thead>
									<tbody>
										<tr>
											<th>상품명</th>
											<td>
												<div class="col-md-8">
													<img id="rpsnImg" class="card-img-top scale" src=""
														alt="no image" />
												</div>
											</td>
										</tr>
										<tr>
											<th>상품명</th>
											<td><input type="hidden" id="gdsName"></td>
										</tr>
										<tr>
											<th>가격</th>
											<td><input type="hidden" id="gdsPrice"></td>
										</tr>
										<tr>
											<th>재고</th>
											<td><input type="hidden" id="gdsStock"></td>
										</tr>
										<tr>
											<th>Total Price</th>
											<td><input type="hidden" id="totalPrice"></td>
										</tr>
										<tr>
											<th>gdsDes</th>
											<td><input type="hidden" id="gdsDes"></textArea>
										</tr>
									</tbody>
								</table>
							</div>

							<div id="pp"></div>
							
							<button type="submit" id="create">new</button>
							<button type="submit" id="create2">new2</button>
<!-- 							<button type="button" id="create">new</button> -->
							 <div></div>


							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" id="saveBtn" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal -->
				<!-- <div class="modal fade bd-example-modal-lg" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> -->



			</div>
		</div>
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
	</article>
</section>
<aside style="float: left; width: 20%">
	<h3>최근글</h3>
	<ul>
		<li>목록1</li>
		<li>목록2</li>
	</ul>

	<div id="floatMenu" class="floatMenu"
		style="position: absolute; width: 200px; height: 200px; right: 50px; top: 550px; background-color: #606060; color: #fff;">
		<span>최근에 본 상품</span>
	</div>
</aside>


<hr class="my-0" />

