//Muse Onhover Get Inline CSS JavaScript
var museNavItem = document.querySelectorAll('.navbar-vertical .nav-item').forEach((museNavItem) => {
  museNavItem.addEventListener('mouseover', (e) => {
    var musePosition = museNavItem.getBoundingClientRect();
    museNavItem.style.top = musePosition.top + 'px';
  });
});

//Muse Masonry JavaScript
var museShuffle = window.Shuffle;
class museShuffleContainer {
  constructor(element) {
    this.element = element;
    this.shuffle = new museShuffle(element, {
      itemSelector: '.masonry-item',
      sizer: element.querySelector('.my-sizer-element'),
    });
    this._activeFilters = [];
    this.museShuffleFilter();
  }
  museShuffleFilter() {
    const options = document.querySelector('.masonry-filters');
    if (!options) {
      return;
    }
    const museShuffleButton = Array.from(options.children);
    const onClick = this._handleFilterClick.bind(this);
    museShuffleButton.forEach((button) => {
      button.addEventListener('click', onClick, false);
    });
  }
  _handleFilterClick(evt) {
    const btn = evt.currentTarget;
    const isActive = btn.classList.contains('active');
    const btnGroup = btn.getAttribute('data-group');
    this._removeActiveClassFromChildren(btn.parentNode);
    let filterGroup;
    if (isActive) {
      btn.classList.remove('active');
      filterGroup = Shuffle.ALL_ITEMS;
    }
    else {
      btn.classList.add('active');
      filterGroup = btnGroup;
    }
    this.shuffle.filter(filterGroup);
  }
  _removeActiveClassFromChildren(parent) {
    const { children } = parent;
    for (let i = children.length - 1; i >= 0; i--) {
      children[i].classList.remove('active');
    }
  }
}
document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.masonry').forEach(museMasonry => {
    window.museShuffleContainer = new museShuffleContainer(museMasonry);
  });
});

//Muse Toggle Class JavaScript
document.querySelectorAll('.back-arrow').forEach(museSidebarToggler => {
  museSidebarToggler.addEventListener('click', ({target}) => {
    target.closest('#mainBox').classList.toggle('sidebar-icons');
  });
});
document.querySelectorAll('.masonry-filters span, .masonry-filters button').forEach(museFilterToggler => {
  museFilterToggler.addEventListener('click', ({target}) => {
    target.closest('.masonry-filters').classList.toggle('display');
  });
});

//Muse Custom JavaScript
function _objectWithoutProperties(source, excluded) { if (source == null) return {}; var target = _objectWithoutPropertiesLoose(source, excluded); var key, i; if (Object.getOwnPropertySymbols) { var sourceSymbolKeys = Object.getOwnPropertySymbols(source); for (i = 0; i < sourceSymbolKeys.length; i++) { key = sourceSymbolKeys[i]; if (excluded.indexOf(key) >= 0) continue; if (!Object.prototype.propertyIsEnumerable.call(source, key)) continue; target[key] = source[key]; } } return target; }

function _objectWithoutPropertiesLoose(source, excluded) { if (source == null) return {}; var target = {}; var sourceKeys = Object.keys(source); var key, i; for (i = 0; i < sourceKeys.length; i++) { key = sourceKeys[i]; if (excluded.indexOf(key) >= 0) continue; target[key] = source[key]; } return target; }

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

var docReady = function docReady(fn) {
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', fn);
  } else {
    setTimeout(fn, 1);
  }
};

//Muse Resize JavaScript
var resize = function resize(fn) {
  return window.addEventListener('resize', fn);
};

//Muse Getdata JavaScript
var getData = function getData(el, data) {
  try {
    return JSON.parse(el.dataset[data]);
  } catch (e) {
    return el.dataset[data];
  }
};

var isScrolledIntoView = function isScrolledIntoView(el) {
  var top = el.offsetTop;
  var left = el.offsetLeft;
  var width = el.offsetWidth;
  var height = el.offsetHeight;

  while (el.offsetParent) {
    el = el.offsetParent;
    top += el.offsetTop;
    left += el.offsetLeft;
  }

  return {
    all: top >= window.pageYOffset && left >= window.pageXOffset && top + height <= window.pageYOffset + window.innerHeight && left + width <= window.pageXOffset + window.innerWidth,
    partial: top < window.pageYOffset + window.innerHeight && left < window.pageXOffset + window.innerWidth && top + height > window.pageYOffset && left + width > window.pageXOffset
  };
};

//Muse Color JavaScript
var hexToRgb = function hexToRgb(hexValue) {
  var hex;
  hexValue.indexOf('#') === 0 ? hex = hexValue.substring(1) : hex = hexValue; // Expand shorthand form (e.g. "03F") to full form (e.g. "0033FF")

  var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
  var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex.replace(shorthandRegex, function (m, r, g, b) {
    return r + r + g + g + b + b;
  }));
  return result ? [parseInt(result[1], 16), parseInt(result[2], 16), parseInt(result[3], 16)] : null;
};
var rgbaColor = function rgbaColor() {
  var color = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '#fff';
  var alpha = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0.5;
  return "rgba(".concat(hexToRgb(color), ", ").concat(alpha, ")");
};
var colors = {
  primary: '#2c7be5',
  secondary: '#748194',
  success: '#00d27a',
  info: '#27bcfd',
  warning: '#f5803e',
  danger: '#e63757',
  light: '#f9fafd',
  dark: '#0b1727'
};
var grays = {
  white: '#fff',
  100: '#f9fafd',
  200: '#edf2f9',
  300: '#d8e2ef',
  400: '#b6c1d2',
  500: '#9da9bb',
  600: '#748194',
  700: '#5e6e82',
  800: '#4d5969',
  900: '#344050',
  1000: '#232e3c',
  1100: '#0b1727',
  black: '#000'
};
var utils = {
  docReady: docReady,
  resize: resize,
  getData: getData,
  hexToRgb: hexToRgb,
  rgbaColor: rgbaColor,
  isScrolledIntoView: isScrolledIntoView,
  colors: colors,
  grays: grays,
};

//Muse choices JavaScript
var choicesInit = function choicesInit() {
  if (window.Choices) {
    var elements = document.querySelectorAll('.js-choice');
    elements.forEach(function (item) {
      var userOptions = utils.getData(item, 'options');
      var choices = new window.Choices(item, _objectSpread({
        itemSelectText: ''
      }, userOptions));
      return choices;
    });
  }
};

//Muse Dropzone JavaScript
window.Dropzone ? window.Dropzone.autoDiscover = false : '';
var dropzoneInit = function dropzoneInit() {
  var merge = window._.merge;
  var Selector = {
    DROPZONE: '[data-dropzone]',
    DZ_ERROR_MESSAGE: '.dz-error-message',
    DZ_PREVIEW: '.dz-preview',
    DZ_PROGRESS: '.dz-preview .dz-preview-cover .dz-progress',
    DZ_PREVIEW_COVER: '.dz-preview .dz-preview-cover'
  };
  var ClassName = {
    DZ_FILE_PROCESSING: 'dz-file-processing',
    DZ_FILE_COMPLETE: 'dz-file-complete',
    DZ_COMPLETE: 'dz-complete',
    DZ_PROCESSING: 'dz-processing'
  };
  var DATA_KEY = {
    OPTIONS: 'options'
  };
  var Events = {
    ADDED_FILE: 'addedfile',
    COMPLETE: 'complete'
  };
  var dropzones = document.querySelectorAll(Selector.DROPZONE);
  !!dropzones.length && dropzones.forEach(function (item) {
    // const element = item;
    // const $this = $(element);
    var userOptions = utils.getData(item, DATA_KEY.OPTIONS);
    userOptions = userOptions || {};
    var data = userOptions.data ? userOptions.data : {};
    var options = merge({
      url: '/assets/php/',
      addRemoveLinks: false,
      previewsContainer: item.querySelector(Selector.DZ_PREVIEW),
      previewTemplate: item.querySelector(Selector.DZ_PREVIEW).innerHTML,
      thumbnailWidth: null,
      thumbnailHeight: null,
      maxFilesize: 20,
      filesizeBase: 1000,
      init: function init() {
        var thisDropzone = this;

        if (data.length) {
          data.forEach(function (v) {
            var mockFile = {
              name: v.name,
              size: v.size
            };
            thisDropzone.options.addedfile.call(thisDropzone, mockFile);
            thisDropzone.options.thumbnail.call(thisDropzone, mockFile, "".concat(v.url, "/").concat(v.name));
          });
        }

        thisDropzone.on(Events.ADDED_FILE, function addedfile() {
          console.log(item.querySelectorAll(Selector.DZ_PREVIEW_COVER));

          if ('maxFiles' in userOptions) {
            if (userOptions.maxFiles === 1 && item.querySelectorAll(Selector.DZ_PREVIEW_COVER).length > 1) {
              item.querySelector(Selector.DZ_PREVIEW_COVER).remove();
            }

            if (userOptions.maxFiles === 1 && this.files.length > 1) {
              this.removeFile(this.files[0]);
            }
          }
        });
      }
    }, userOptions); // eslint-disable-next-line

    item.querySelector(Selector.DZ_PREVIEW).innerHTML = "";
    var dropzone = new window.Dropzone(item, options);
    dropzone.on(Events.ADDED_FILE, function () {
      if (item.querySelector(Selector.DZ_PREVIEW_COVER)) {
        item.querySelector(Selector.DZ_PREVIEW_COVER).classList.remove(ClassName.DZ_FILE_COMPLETE);
      }

      item.classList.add(ClassName.DZ_FILE_PROCESSING);
    });
    dropzone.on(Events.COMPLETE, function () {
      if (item.querySelector(Selector.DZ_PREVIEW_COVER)) {
        item.querySelector(Selector.DZ_PREVIEW_COVER).classList.remove(ClassName.DZ_PROCESSING);
      }

      item.classList.add(ClassName.DZ_FILE_COMPLETE);
    });
  });
};

//Muse Flatpicker JavaScript
var flatpickrInit = function flatpickrInit() {
  if (window.flatpickr) {
    var datetimepickers = document.querySelectorAll('.datetimepicker');
    datetimepickers.forEach(function (datetimepicker) {
      var options = utils.getData(datetimepicker, 'options');
      window.flatpickr(datetimepicker, _objectSpread({
        dateFormat: 'd/m/y',
        disableMobile: true
      }, options));
    });
  }
};

//Muse Inline Player JavaScript
var plyrInit = function plyrInit() {
  if (window.Plyr) {
    var plyrs = document.querySelectorAll('.player');
    plyrs.forEach(function (plyr) {
      var userOptions = utils.getData(plyr, 'options');
      var defaultOptions = {
        captions: {
          active: true
        }
      };

      var options = window._.merge(defaultOptions, userOptions);

      return new window.Plyr(plyr, options);
    });
  }
};

//Muse Popover JavaScript
var popoverInit = function popoverInit() {
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-toggle="popover"]'));
  popoverTriggerList.map(function (popoverTriggerEl) {
    return new window.bootstrap.Popover(popoverTriggerEl, {
      trigger: 'focus'
    });
  });
};

//Muse Progressbar JavaScript
var progressBar = function progressBar() {
  var merge = window._.merge; 
  var progresCircle = document.querySelectorAll('.progress-circle');

  if (progresCircle.length) {
    progresCircle.forEach(function (item) {
      var userOptions = utils.getData(item, 'options');
      var defaultOptions = {
        strokeWidth: 2,
        trailWidth: 2,
        trailColor: utils.grays['200'],
        easing: 'easeInOut',
        duration: 3000,
        svgStyle: {
          'stroke-linecap': 'round',
          display: 'block',
          width: '100%'
        },
        text: {
          autoStyleContainer: false
        },
        // Set default step function for all animate calls
        step: function step(state, circle) {
          var percentage = Math.round(circle.value() * 100);
          circle.setText("<span class='value'>".concat(percentage, "<b>%</b></span> <span>").concat(userOptions.text || '', "</span>"));
        }
      };
      var options = merge(defaultOptions, userOptions);
      var bar = new ProgressBar.Circle(item, options);
      var linearGradient = "<defs>\n        <linearGradient id=\"gradient\" x1=\"0%\" y1=\"0%\" x2=\"100%\" y2=\"0%\" gradientUnits=\"userSpaceOnUse\">\n          <stop offset=\"0%\" stop-color='#1970e2' />\n          <stop offset=\"100%\" stop-color='#4695ff' />\n        </linearGradient>\n      </defs>";
      bar.svg.insertAdjacentHTML('beforeEnd', linearGradient);
      var playProgressTriggered = false;

      var progressCircleAnimation = function progressCircleAnimation() {
        if (!playProgressTriggered) {
          if (utils.isScrolledIntoView(item).partial) {
            bar.animate(options.progress / 100);
            playProgressTriggered = true;
          }
        }

        return playProgressTriggered;
      };

      progressCircleAnimation();
      window.addEventListener('scroll', function () {
        progressCircleAnimation();
      });
    });
  }
};

//Muse Toast JavaScript
var toastInit = function toastInit() {
  var toastElList = [].slice.call(document.querySelectorAll('.toast'));
  toastElList.map(function (toastEl) {
    return new window.bootstrap.Toast(toastEl);
  });
};

//Muse Tooltip JavaScript
var tooltipInit = function tooltipInit() {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-toggle="tooltip"]'));
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new window.bootstrap.Tooltip(tooltipTriggerEl);
  });
};

//Muse Theme Initialization
docReady(progressBar);
docReady(tooltipInit);
docReady(popoverInit);
docReady(flatpickrInit);
docReady(toastInit);
docReady(plyrInit);
docReady(dropzoneInit);
docReady(choicesInit);