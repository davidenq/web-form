<web-form>
  <style>
    html {
      box-sizing: border-box;
    }
    *, *::after, *::before {
      box-sizing: inherit;
    }

    .inner-spinner { 
        position: relative; 
    }
    .inner-spinner .spinner {
      position: absolute;
      padding: 15px 0 0 0;
      pointer-events: none;
    }

    .right-spinner .spinner { right: 0px;}

    .rect {
      fill: none;
      stroke-width: 2px;
      stroke: black;
      stroke-dasharray: 20;
      stroke-dashoffset: 50%;
      -webkit-animation: movedash 0.6s forwards 0s infinite;
              animation: movedash 0.6s forwards 0s infinite;
    }

    @-webkit-keyframes movedash {
      to {
        stroke-dashoffset: 150%;
      }
    }

    @keyframes movedash {
      to {
        stroke-dashoffset: 150%;
      }
    }
  </style>
  
  <form class="ui form equal width ">
    <div class="{element.class}" each={element, value in inputs}>
      <div class="field {value.class}" id="{value.name}" each={value in element.block}>
        <div class="inner-spinner right-spinner">
          <i class="spinner" id="spinner-{value.name}"></i>
          <label>{value.label}</label>
          <input name={value.name} placeholder={value.placeholder} type={value.type} onkeyup={validate} id="{value.api}">
        </div>
      </div>
    </div>
    <div class="field" if={checkbox.show}>
      <div class="ui checkbox">
        <input class="hidden" tabindex="0" type="checkbox">
        <label>{checkbox.label}</label>
      </div>
    </div>
    <button class="ui button {button.class}" type="submit">{button.label}</button>    
  </form>
  
  <script>

    this.checkbox = opts.checkbox;
    this.button = opts.button;
    this.inputs = opts.inputs;
    this.fetch = opts.fetch;
    
    let className = null;
    
    validate (e) {
      
      const target = e.target;
      const value = target.value;
      const id = target.id;
      const name = target.name;
      
      const tag = document.getElementById(name);
      let spinner = document.getElementById('spinner-'+name);
       
      if(!className){
        className = tag.className;
      }

      if(value !== '' && id == 'true'){
        
        const uri = this.fetch.url + '?' + name + '=' + value;
        spinner.innerHTML = '<svg width="25" height="50" viewbox="0 0 40 40"><polygon points="0 0 0 20 20 20 20 0" class="rect" /></svg>';

        fetch(uri)
          .then((response) => {
            return response.json();
          })
          .then((result) => {

            spinner.innerHTML = '';
            
            if(result.length){
              tag.className += ' error'; 
            } else {
              tag.className = className;
            } 
            return
          })
          .catch((err) => {
            console.log(err);
          })
      } else {
        tag.className = className;
      }
    }    
  </script>
</web-form>