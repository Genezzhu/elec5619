NOTICE
=========
- **NEVER PUSH BROKEN CODE TO HERE**
- Please use Spring roo to genearte domain, controller, service classes. write your own dao classes
- All the Spring Roo default CRUD controller's path should be prefixed with "admin". e.g. /admin/client. see the example below
- If  u still confused about Spring roo, try read **Exercise Record** code


HOW TO USE SPRING ROO
=========

Please read spring roo tutorial document first. [OFFICIAL TURORIAL](http://docs.spring.io/spring-roo/reference/html/beginning.html)

We need to use Spring Roo to generate **Domain** classes (DTO/POJO/BEAN), **Controller** Classes, **Service** Classses, and we need to write the **DAO** file ourselvies

Here is some simple example

- create Entity like this
```sh
entity jpa --class ~.domain.ExerciseType
entity jpa --class ~.domain.Exercise
```
- then add field like this
```sh
field string --fieldName name --notNull --sizeMin 2
field number --fieldName exerciseAttribute --type int
```
- switch focus entity
```sh
focus --class ~.domain.ExerciseType
field string --fieldName name --notNull --sizeMin 2
field number --fieldName exerciseTypeAttribute --type int
```
- Then create spring default CRUD controller in admin folder. in this way
- **prefix the path with "admin" like /admin/XXX**
```sh
web mvc scaffold --class ~.web.admin.ExerciseTypeController --path admin/exercisetypes --backingType ~.domain.ExerciseType
web mvc scaffold --class ~.web.admin.ExerciseController --path admin/exercises --backingType ~.domain.Exercise
```
- Create your service class
```sh
service type --interface ~.service.ClientService --entity ~.domain.Client
```
- Write your own dao class, have a look at ClientDao

ABOUT JSPX
=========

Spting Roo use **jspx** instead of jsp. which means u need to write XML format jsp. It has very strict syntax. 
U can't have empty attribute and unclosed tag. Here is a **INVALID** example
```html
<input type="text" required >
```
Error of above example

- u can't just use "required", because there is no value. u need to use **required="true"**

- u need to close this input tag. use **/>** at end, or use **</input>**

```html
<input type="text" required="true"/>
```

ABOUT STATIC FILES
=========
all the static files is inside **webapp/static** folder. please **do not change** the folder structure. It's perfect now.


### CSS ###
We use [Bootstrap](http://getbootstrap.com/) as our css framework, also we use [Font-awesome](http://fortawesome.github.io/Font-Awesome/) as well. Have a look at their site.

If u need to write ur own css file, please include them inside 
**static/css/main.css**


```
#!css

@import "YOUR_OWN_FILE.css"
```


### JS ###
We use library jQuery, Underscore,

You can write both inline java script, or put them into a separate file
- if u write ur own one, then include it from your** jspx template**


### Always have a look at exercise_records example, see how this part are implemented ###