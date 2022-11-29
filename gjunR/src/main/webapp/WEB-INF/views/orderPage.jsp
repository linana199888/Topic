<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Page</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="css/order.css" />
  </head>
  <body>
    <div class="container">
      <div class="pt-5 pb-3 d-flex">
        <img
          width="50"
          height="50"
          src="https://scontent.ftpe8-3.fna.fbcdn.net/v/t1.6435-9/183446961_5786399431370995_238227825131624894_n.png?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=yKu9KmnA-JgAX-gc2EJ&_nc_ht=scontent.ftpe8-3.fna&oh=00_AfCjo3SgORJzmeSFumQFhCHC5LmOLK6F7heJsPzEjNG7Lg&oe=63A1AD0C"
          alt=""
        />
        <h1 class="ms-3">Gjun Restaurant</h1>
      </div>
      <div
        id="carouselExampleControls"
        class="carousel slide"
        data-bs-ride="carousel"
      >
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="assets/carousel1.jpg" class="d-block w-100" />
          </div>
          <div class="carousel-item">
            <img src="assets/carousel2.jpg" class="d-block w-100" />
          </div>
          <div class="carousel-item">
            <img src="assets/carousel3.jpg" class="d-block w-100" />
          </div>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleControls"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <nav class="nav nav-pills flex-column flex-sm-row mt-3 mb-4 mt-sm-5">
        <c:forEach var="pt" items="${productsTypeList}" varStatus="loop">
          <a
            class="flex-sm-fill text-sm-center nav-link ${loop.index == 0 ? 'active' : ''}"
            aria-current="page"
            href="#${pt.chiTypeDes}"
            >${pt.chiTypeDes}</a
          >
        </c:forEach>
      </nav>
      <c:forEach var="pt" items="${productsTypeList}">
        <h3 id="${pt.chiTypeDes}">${pt.chiTypeDes}</h3>
        <div class="row g-3 mb-5">
          <c:forEach var="p" items="${productsList}">
            <c:if test="${p.productCatagory == pt.typeID}">
              <div class="col-md-6 col-xl-4">
                <div class="card">
                  <div class="row g-0">
                    <div class="col-md-8">
                      <div class="card-body">
                        <h5 class="card-title">${p.productNameChi}</h5>
                        <span class="price">${p.productPrice}</span>
                        <p class="card-text">${p.productDescribe}</p>
                        <div class="d-flex">
                          <button
                            type="button"
                            class="btn btn-primary me-2 getIDBtn"
                            data-id="${p.productID}"
                            data-price="${p.productPrice}"
                            data-name="${p.productNameChi}"
                            data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasRight"
                            aria-controls="offcanvasRight"
                          >
                            <i class="fa-solid fa-cart-shopping"></i>
                          </button>
                          <div class="input-group">
                            <button
                              type="button"
                              class="btn btn-outline-primary addBtn"
                            >
                              <i class="fa-solid fa-plus"></i>
                            </button>
                            <input
                              type="text"
                              class="form-control text-center red-input"
                              placeholder=""
                              aria-label="Example text with button addon"
                              aria-describedby="button-addon1"
                              value="1"
                              readonly
                              data-id="${p.productID}"
                            />
                            <button
                              type="button"
                              class="btn btn-outline-primary minusBtn"
                            >
                              <i class="fa-solid fa-minus"></i>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div
                        class="cover w-100 h-100"
                        style="
                          background-image: url('assets/${p.productImagePath}');
                        "
                      ></div>
                      <!-- <img src="/assets/01.jpeg" class="img-fluid rounded-start" alt="..." /> -->
                    </div>
                  </div>
                </div>
              </div>
            </c:if>
          </c:forEach>
        </div>
      </c:forEach>
      <div
        class="offcanvas offcanvas-end"
        tabindex="-1"
        id="offcanvasRight"
        aria-labelledby="offcanvasRightLabel"
      >
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasRightLabel">購物車</h5>
          <button class="btn btn-primary checkoutBtn">點餐</button>
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
          ></button>
        </div>
        <div class="offcanvas-body"></div>
      </div>
    </div>
    <script>
      // 給前端渲染資料
      let list = new Object();
      // 準備資料傳給後端
      let data = new Array();

      $(".getIDBtn").click(function () {
        const productID = $(this).attr("data-id");
        const quantity = $("input[data-id=" + productID + "]").val();
        const productName = $(this).attr("data-name");
        const productPrice = $(this).attr("data-price");
        const tempArray = { productID, quantity };
        data.push(tempArray);
        // console.log(data);
        list[productID] = { quantity, productName, productPrice };
        let html = "<div>";
        Object.values(list).forEach(
          (item) =>
            (html +=
              "<div>" + item.productName + "= " + item.quantity + "</div>")
        );
        html += "</div>";
        $(".offcanvas-body").html(html);
        // console.log(list);
        localStorage.setItem("Shopcart", JSON.stringify(list));
      });

      $(".checkoutBtn").click(function () {
        $.ajax({
          url: "order/add",
          type: "POST",
          data: JSON.stringify(data),
          contentType: "application/json",
          success: function (msg) {
            list = {};
            data = [];
            let html = "";
            $(".offcanvas-body").html(html);
            alert(msg);
          },
          error: function () {
            console.log("error");
          },
        });
      });
      $(".addBtn").click(function () {
        let quantity = $(this).siblings("input").val();
        quantity++;
        $(this).siblings("input").val(quantity);
      });
      $(".minusBtn").click(function () {
        let quantity = $(this).siblings("input").val();
        if (quantity == 1) {
          return;
        }
        quantity--;
        $(this).siblings("input").val(quantity);
      });
      $("nav")
        .find("a")
        .click(function () {
          $("nav").find(".active").removeClass("active");
          $(this).addClass("active");
        });
    </script>
  </body>
</html>
