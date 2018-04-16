<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
	<div class="row">
		<div class="col-xs-12 text-center">
			<h1>Dashboard</h1>
		</div>
	</div>
	<div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>${jmlAdj }<sup style="font-size: 20px">New</sup></h3>

              <p>Adjustment</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="${pageContext.request.contextPath}/dashboard/adj" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>${jmlTs }<sup style="font-size: 20px">New</sup></h3>

              <p>Transfer Stock</p>
            </div>
            <div class="icon">
              <i class="ion ion-android-share"></i>
            </div>
            <a href="${pageContext.request.contextPath}/dashboard/ts" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>${jmlPO }<sup style="font-size: 20px">New</sup></h3>

              <p>Purchase</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="${pageContext.request.contextPath}/dashboard/po" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>${jmlSo }<sup style="font-size: 20px">New</sup></h3>

              <p>Sales Order</p>
            </div>
            <div class="icon">
              <i class="ion ion-ios-cart"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
</section>
</body>
</html>