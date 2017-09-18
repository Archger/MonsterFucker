 <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
      
      
      <div class="row">
      	<div class="row">
     	<div class="input-field col s12">
    <select>
      <option value="" disabled selected>Choose your option</option>
      <option value="1">选项 1</option>
      <option value="2">选项 2</option>
      <option value="3">选项 3</option>
    </select>
    <label>Materialize 下拉列表</label>
  </div>

  <div class="input-field col s12">
    <select multiple>
      <option value="" disabled selected>Choose your option</option>
      <option value="1">选项 1</option>
      <option value="2">选项 2</option>
      <option value="3">选项 3</option>
    </select>
    <label>Materialize多选下拉列表</label>
  </div>

  <div class="input-field col s12">
    <select multiple>
      <optgroup label="team 1">
        <option value="1">选项 1</option>
        <option value="2">选项 2</option>
      </optgroup>
      <optgroup label="team 2">
        <option value="3">选项 3</option>
        <option value="4">选项 4</option>
      </optgroup>
    </select>
    <label>选项组</label>
  </div>

  <div class="input-field col s12 m6">
    <select class="icons">
      <option value="" disabled selected>Choose your option</option>
      <option value="" data-icon="images/sample-1.jpg" class="circle">示例 1</option>
      <option value="" data-icon="images/office.jpg" class="circle">示例 2</option>
      <option value="" data-icon="images/yuna.jpg" class="circle">示例 1</option>
    </select>
    <label>下拉列表中的图片</label>
  </div>
  <div class="input-field col s12 m6">
    <select class="icons">
      <option value="" disabled selected>Choose your option</option>
      <option value="" data-icon="images/sample-1.jpg" class="left circle">示例 1</option>
      <option value="" data-icon="images/office.jpg" class="left circle">示例 2</option>
      <option value="" data-icon="images/yuna.jpg" class="left circle">示例 3</option>
    </select>
    <label>下拉列表中的图片</label>
  </div>

  <label>Browser Select</label>
  <select class="browser-default">
    <option value="" disabled selected>Choose your option</option>
    <option value="1">选项 1</option>
    <option value="2">选项 2</option>
    <option value="3">选项 3</option>
  </select>
     </div>
     
      <div class="row">
    <form class="col s12">
      <div class="row">
        <div class="input-field col s12">
          <textarea id="textarea1" class="materialize-textarea"></textarea>
          <label for="textarea1">文本域</label>
        </div>
      </div>
    </form>
  </div>
  
  <div class="fixed-action-btn">
    <a class="btn-floating btn-large red">
      <i class="large material-icons">mode_edit</i>
    </a>
    <ul>
      <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
      <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
      <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
      <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
    </ul>
  </div>
      
      	
      </div>
      
      
    </body>
  </html>
