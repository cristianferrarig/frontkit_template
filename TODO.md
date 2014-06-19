-[√] add gem 'middleman-autoprefixer', '~> 1.1.2'
-[√] add gem 'font-awesome-middleman', '~> 4.0.3'
-[ ] add picturefill - https://github.com/scottjehl/picturefill


@mixin multi-line {
  line-height: 1.4;
  height: auto;
  white-space: normal;
}


@mixin multi-line-button($name: $multi-line-button-name) {
  @include selector($name) {
    @include multi-line;
    padding: .8em 1em;
    small { display: block; }
  }
}


@mixin segmented-button($name: $segmented-button-name) {
  @include selector($name) {
    padding: 0;
    div {
      display: inline-block;
      padding: .6em 1em;
    }
    div + div {
      border-left: 1px solid #DDD;
    }
  }
}

@mixin segmented-multi-line-button($name: $segmented-multi-line-button-name) {
  @include selector($name) {
    @include multi-line;
    padding: 0;
    max-width: 300px;
    div {
      display: table-cell;
      padding: .6em 1em;
      vertical-align: middle;
    }
    div + div {
      border-left: 1px solid #DDD;
    }
  }
}


@mixin selector($name) {
  #{unquote($name)} {
    @content;
  }
}

@mixin component($name: $component-name) {
  @include selector($name) {
    @content;
  }
}



// #{$button-name},
// #{$segmented-button-name},
// #{$multi-line-button-name},
// #{$segmented-multi-line-button-name}
// {
//   background-color: white;
//   box-shadow: 0 1px 1px rgba(gray,.5);
//   margin: 20px;
//   &:hover {
//     background-color: darken(white,2%);
//   }
// }
//
// #{$segmented-button-name},
// #{$segmented-multi-line-button-name}
// {
//   div + div {
//     background-color: darken(white,2%);
//   }
//   &:hover {
//     div + div {
//       background-color: darken(white,4%);
//     }
//   }
// }





//
// Variables
// --------------------------------------------------

// Grayscale
@black-10:                 darken(#fff, 10%);
@black-20:                 darken(#fff, 20%);
@black-30:                 darken(#fff, 30%);
@black-40:                 darken(#fff, 40%);
@black-50:                 darken(#fff, 50%);
@black-60:                 darken(#fff, 60%);
@black-70:                 darken(#fff, 70%);
@black-80:                 darken(#fff, 80%);
@black-90:                 darken(#fff, 90%);

// Brand colors
@brand-primary:           #428bca;
@brand-success:           #5cb85c;
@brand-warning:           #f0ad4e;
@brand-danger:            #d9534f;
@brand-info:              #5bc0de;

// Scaffolding
@body-background:         #fff;
@text-color:              @black-50;

// Links
@link-color:              @brand-primary;
@link-color-hover:        darken(@link-color, 15%);

// Typography
@font-family-sans-serif:  "Helvetica Neue", Helvetica, Arial, sans-serif;
@font-family-serif:       Georgia, "Times New Roman", Times, serif;
@font-family-monospace:   Monaco, Menlo, Consolas, "Courier New", monospace;
@font-family-base:        @font-family-sans-serif;

@font-size-base:          14px;
@font-size-large:         @font-size-base * 1.25; // ~18px
@font-size-small:         @font-size-base * 0.85; // ~12px
@font-size-mini:          @font-size-base * 0.75; // ~11px

@line-height-base:        1.4;

@headings-font-family:    inherit; // empty to use BS default, @font-family-base
@headings-font-weight:    500;

// Forms
@input-color-placeholder: lighten(@text-color, 25%);

// Grid
// Used with the grid mixins below
@grid-columns:          12;
@grid-column-padding:   15px; // Left and right inner padding
@grid-float-breakpoint: 768px;











$include-classes:              true !default;
$include-schemas:              true !default;


$global: (
  radius:    5px,
  rounded: 100px,
);

$breakpoints: (
  xsmall:  480px,
  small:   600px,
  medium:  900px,
  large:  1200px,
  xlarge: 1400px
);

$schema: (
  default: #DDDDDD,
  success: #9ACA40,
  warning: #FEBA31,
  danger:  #E63917,
  info:    #3CBBCA
);

$input: (
  class-name:  ".input",
  font-family: inherit,
  font-weight: normal,
  font-size:   1em,
  height:      3em,
  line-height: 1.4,
  border:      0 none,
  padding:     1em,
  margin:      false,
);

@function schema($color:default) {
  @return map-get($schema,$color);
}



























---
title: Components
body_class:
---

%h1 Buttons


%h5 Button tags

%a.button a
%input.button{type: "button", value: "input"}
%input.button{type: "submit", value: "submit"}
%button.button{type: "button"} button
%div.button div
%span.button span

%hr

%h5 Static sizes

%a(component class="button xx-small") Button xx-small
%a(component class="button x-small")  Button x-small
%a(component class="button small")    Button small
%a(component class="button medium")   Button medium
%a(component class="button large")    Button large
%a(component class="button x-large")  Button x-large
%a(component class="button xx-large") Button xx-large

%hr

%h5 Relative sizes

.button.smaller(component)  hola
.button(component)          hola
.button.larger(component)   hola

%hr



%h5 Multi line Button

.button Hola

.button.multi-line-button Hola

.button.multi-line-button
  Download Here
  %div Version 3.5 12mb


.button.multi-line-button
  Download Here
  %small Version 3.5 12mb

.button.multi-line-button
  %h3 Hola asdasd
  %p= lorem.words 4


.button.segmented-button
  %div Hola
  %div
    %i.icon-user


.button.segmented-multi-line-button
  %div Hola asdasd<br/>asdasdas
  %div
    %i.icon-user

.button.segmented-multi-line-button
  %div
    %h3 Hola asdasd
    %p= lorem.words 4
  %div
    %i.icon-user




%hr

%h5 Colors

.button                  basic
.button.button-primary   primary
.button.button-secondary secondary
.button.button-default   default
.button.button-info      info
.button.button-success   success
.button.button-warning   warning
.button.button-danger    danger