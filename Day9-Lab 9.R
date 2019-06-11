NorthAmerican <- function(eatsBreakfast=TRUE,myFavorite="cereal")
{
  
  me <- list(
    hasBreakfast = eatsBreakfast,
    favoriteBreakfast = myFavorite
  )
  
  ## Set the name for the class
  class(me) <- append(class(me),"NorthAmerican")
  return(me)
}
bubba <- NorthAmerican()
bubba
bubba$hasBreakfast
louise <- NorthAmerican(eatsBreakfast=TRUE,myFavorite="fried eggs")
louise

NordAmericain <- function(eatsBreakfast=TRUE,myFavorite="cereal")
{
  
  ## Get the environment for this
  ## instance of the function.
  thisEnv <- environment()
  
  hasBreakfast <- eatsBreakfast
  favoriteBreakfast <- myFavorite
  
  ## Create the list used to represent an
  ## object for this class
  me <- list(
    
    ## Define the environment where this list is defined so
    ## that I can refer to it later.
    thisEnv = thisEnv,
    
    ## The Methods for this class normally go here but are discussed
    ## below. A simple placeholder is here to give you a teaser....
    getEnv = function()
    {
      return(get("thisEnv",thisEnv))
    }
    
  )
  
  ## Define the value of the list within the current environment.
  assign('this',me,envir=thisEnv)
  
  ## Set the name for the class
  class(me) <- append(class(me),"NordAmericain")
  return(me)
}


bubba <- NordAmericain()
get("hasBreakfast",bubba$getEnv())
get("favoriteBreakfast",bubba$getEnv())

bubba <- NordAmericain(myFavorite="oatmeal")
get("favoriteBreakfast",bubba$getEnv())

louise <- bubba
assign("favoriteBreakfast","toast",louise$getEnv())
get("favoriteBreakfast",louise$getEnv())
get("favoriteBreakfast",bubba$getEnv())
-------------------------------
  S3. Creating Methods
setHasBreakfast <- function(elObjeto, newValue)
{
  print("Calling the base setHasBreakfast function")
  UseMethod("setHasBreakfast",elObjeto)
  print("Note this is not executed!")
}

setHasBreakfast.default <- function(elObjeto, newValue)
{
  print("You screwed up. I do not know how to handle this object.")
  return(elObjeto)
}


setHasBreakfast.NorthAmerican <- function(elObjeto, newValue)
{
  print("In setHasBreakfast.NorthAmerican and setting the value")
  elObjeto$hasBreakfast <- newValue
  return(elObjeto)
}
bubba <- NorthAmerican()
bubba$hasBreakfast
bubba <- setHasBreakfast(bubba,FALSE)
bubba$hasBreakfast
bubba <- setHasBreakfast(bubba,"No type checking sucker!")
bubba$hasBreakfast
someNumbers <- 1:4
someNumbers <- setHasBreakfast(someNumbers,"what?")
someNumbers



getHasBreakfast <- function(elObjeto)
{
  print("Calling the base getHasBreakfast function")
  UseMethod("getHasBreakfast",elObjeto)
  print("Note this is not executed!")
}

getHasBreakfast.default <- function(elObjeto)
{
  print("You screwed up. I do not know how to handle this object.")
  return(NULL)
}


getHasBreakfast.NorthAmerican <- function(elObjeto)
{
  print("In getHasBreakfast.NorthAmerican and returning the value")
  return(elObjeto$hasBreakfast)
}


bubba <- NorthAmerican()
bubba <- setHasBreakfast(bubba,"No type checking sucker!")
result <- getHasBreakfast(bubba)
result
----------------------------------------
  NordAmericain <- function(eatsBreakfast=TRUE,myFavorite="cereal")
  {
    
    ## Get the environment for this
    ## instance of the function.
    thisEnv <- environment()
    
    hasBreakfast <- eatsBreakfast
    favoriteBreakfast <- myFavorite
    
    ## Create the list used to represent an
    ## object for this class
    me <- list(
      
      ## Define the environment where this list is defined so
      ## that I can refer to it later.
      thisEnv = thisEnv,
      
      ## Define the accessors for the data fields.
      getEnv = function()
      {
        return(get("thisEnv",thisEnv))
      },
      
      getHasBreakfast = function()
      {
        return(get("hasBreakfast",thisEnv))
      },
      
      setHasBreakfast = function(value)
      {
        return(assign("hasBreakfast",value,thisEnv))
      },
      
      
      getFavoriteBreakfast = function()
      {
        return(get("favoriteBreakfast",thisEnv))
      },
      
      setFavoriteBreakfast = function(value)
      {
        return(assign("favoriteBreakfast",value,thisEnv))
      }
      
    )
    
    ## Define the value of the list within the current environment.
    assign('this',me,envir=thisEnv)
    
    ## Set the name for the class
    class(me) <- append(class(me),"NordAmericain")
    return(me)
  }


bubba <- NordAmericain(myFavorite="oatmeal")
bubba$getFavoriteBreakfast()
bubba$setFavoriteBreakfast("plain toast")
bubba$getFavoriteBreakfast()



makeCopy <- function(elObjeto)
{
  print("Calling the base makeCopy function")
  UseMethod("makeCopy",elObjeto)
  print("Note this is not executed!")
}

makeCopy.default <- function(elObjeto)
{
  print("You screwed up. I do not know how to handle this object.")
  return(elObjeto)
}


makeCopy.NordAmericain <- function(elObjeto)
{
  print("In makeCopy.NordAmericain and making a copy")
  newObject <- NordAmericain(
    eatsBreakfast=elObjeto$getHasBreakfast(),
    myFavorite=elObjeto$getFavoriteBreakfast())
  return(newObject)
}

bubba <- NordAmericain(eatsBreakfast=FALSE,myFavorite="oatmeal")
louise <- makeCopy(bubba)
louise$getFavoriteBreakfast()
louise$setFavoriteBreakfast("eggs")
louise$getFavoriteBreakfast()
bubba$getFavoriteBreakfast()
-----------------------------------------
  Mexican <- function(eatsBreakfast=TRUE,myFavorite="los huevos")
  {
    
    me <- NorthAmerican(eatsBreakfast,myFavorite)
    
    ## Add the name for the class
    class(me) <- append(class(me),"Mexican")
    return(me)
  }


USAsian <- function(eatsBreakfast=TRUE,myFavorite="pork belly")
{
  
  me <- NorthAmerican(eatsBreakfast,myFavorite)
  
  ## Add the name for the class
  class(me) <- append(class(me),"USAsian")
  return(me)
}

Canadian <- function(eatsBreakfast=TRUE,myFavorite="back bacon")
{
  
  me <- NorthAmerican(eatsBreakfast,myFavorite)
  
  ## Add the name for the class
  class(me) <- append(class(me),"Canadian")
  return(me)
}

Anglophone <- function(eatsBreakfast=TRUE,myFavorite="pancakes")
{
  
  me <- Canadian(eatsBreakfast,myFavorite)
  
  ## Add the name for the class
  class(me) <- append(class(me),"Anglophone")
  return(me)
}

Francophone <- function(eatsBreakfast=TRUE,myFavorite="crepes")
{
  
  me <- Canadian(eatsBreakfast,myFavorite)
  
  ## Add the name for the class
  class(me) <- append(class(me),"Francophone")
  return(me)
}

francois <- Francophone()
francois



makeBreakfast <- function(theObject)
{
  print("Calling the base makeBreakfast function")
  UseMethod("makeBreakfast",theObject)
}

makeBreakfast.default <- function(theObject)
{
  print(noquote(paste("Well, this is awkward. Just make",
                      getFavoriteBreakfast(theObject))))
  return(theObject)
}

makeBreakfast.Mexican <- function(theObject)
{
  print(noquote(paste("Estoy cocinando",
                      getFavoriteBreakfast(theObject))))
  NextMethod("makeBreakfast",theObject)
  return(theObject)
}

makeBreakfast.USAsian <- function(theObject)
{
  print(noquote(paste("Leave me alone I am making",
                      getFavoriteBreakfast(theObject))))
  NextMethod("makeBreakfast",theObject)
  return(theObject)
}

makeBreakfast.Canadian <- function(theObject)
{
  print(noquote(paste("Good morning, how would you like",
                      getFavoriteBreakfast(theObject))))
  NextMethod("makeBreakfast",theObject)
  return(theObject)
}

makeBreakfast.Anglophone <- function(theObject)
{
  print(noquote(paste("I hope it is okay that I am making",
                      getFavoriteBreakfast(theObject))))
  NextMethod("makeBreakfast",theObject)
  return(theObject)
}

makeBreakfast.Francophone <- function(theObject)
{
  print(noquote(paste("Je cuisine",
                      getFavoriteBreakfast(theObject))))
  NextMethod("makeBreakfast",theObject)
  return(theObject)
}


francois <- makeBreakfast(francois)

-----------------------------------
  S4

######################################################################
# Create the base Agent class
#
# This is used to represent the most basic agent in a simulation.
Agent <- setClass(
  # Set the name for the class
  "Agent",
  
  # Define the slots
  slots = c(
    location = "numeric",
    velocity   = "numeric",
    active   = "logical"
  ),
  
  # Set the default values for the slots. (optional)
  prototype=list(
    location = c(0.0,0.0),
    active   = TRUE,
    velocity = c(0.0,0.0)
  ),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity=function(object)
  {
    if(sum(object@velocity^2)>100.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  }
)
Now that the code to define the class is given we can create an object whose class is Agent.

a <- Agent()
a
is.object(a)
isS4(a)
slotNames(a)
slotNames("Agent")
getSlots("Agent")
s <- getSlots("Agent")
names(s)
getClass(a)
getClass("Agent")
slot(a,"location")
slot(a,"location") <- c(1,5)
a
---------------------
  2.3. Creating Methods
# create a method to assign the value of the location
setGeneric(name="setLocation",
           def=function(theObject,position)
           {
             standardGeneric("setLocation")
           }
)

setMethod(f="setLocation",
          signature="Agent",
          definition=function(theObject,position)
          {
            theObject@location <- position
            validObject(theObject)
            return(theObject)
          }
)

# create a method to get the value of the location
setGeneric(name="getLocation",
           def=function(theObject)
           {
             standardGeneric("getLocation")
           }
)

setMethod(f="getLocation",
          signature="Agent",
          definition=function(theObject)
          {
            return(theObject@location)
          }
)


# create a method to assign the value of active
setGeneric(name="setActive",
           def=function(theObject,active)
           {
             standardGeneric("setActive")
           }
)

setMethod(f="setActive",
          signature="Agent",
          definition=function(theObject,active)
          {
            theObject@active <- active
            validObject(theObject)
            return(theObject)
          }
)

# create a method to get the value of active
setGeneric(name="getActive",
           def=function(theObject)
           {
             standardGeneric("getActive")
           }
)

setMethod(f="getActive",
          signature="Agent",
          definition=function(theObject)
          {
            return(theObject@active)
          }
)


# create a method to assign the value of velocity
setGeneric(name="setVelocity",
           def=function(theObject,velocity)
           {
             standardGeneric("setVelocity")
           }
)

setMethod(f="setVelocity",
          signature="Agent",
          definition=function(theObject,velocity)
          {
            theObject@velocity <- velocity
            validObject(theObject)
            return(theObject)
          }
)

# create a method to get the value of the velocity
setGeneric(name="getVelocity",
           def=function(theObject)
           {
             standardGeneric("getVelocity")
           }
)

setMethod(f="getVelocity",
          signature="Agent",
          definition=function(theObject)
          {
            return(theObject@velocity)
          }
)


a <- Agent()
getVelocity(a)
a <- setVelocity(a,c(1.0,2.0))
getVelocity(a)

---------------------
  # create a method to reset the velocity and the activity
  setGeneric(name="resetActivity",
             def=function(theObject,value)
             {
               standardGeneric("resetActivity")
             }
  )

setMethod(f="resetActivity",
          signature=c("Agent","logical"),
          definition=function(theObject,value)
          {
            theObject <- setActive(theObject,value)
            theObject <- setVelocity(theObject,c(0.0,0.0))
            return(theObject)
          }
)

setMethod(f="resetActivity",
          signature=c("Agent","numeric"),
          definition=function(theObject,value)
          {
            theObject <- setActive(theObject,TRUE)
            theObject <- setVelocity(theObject,value)
            return(theObject)
          }
)
a <- Agent()
a
a <- resetActivity(a,FALSE)
getActive(a)
a <- resetActivity(a,c(1,3))
getVelocity(a)

######################################################################
# Create the Prey class
#
# This is used to represent a prey animal
Prey <- setClass(
  # Set the name for the class
  "Prey",
  
  # Define the slots - in this case it is empty...
  slots = character(0),
  
  # Set the default values for the slots. (optional)
  prototype=list(),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity=function(object)
  {
    if(sum(object@velocity^2)>70.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  },
  
  # Set the inheritance for this class
  contains = "Agent"
)



######################################################################
# Create the Bobcat class
#
# This is used to represent a smaller predator
Bobcat <- setClass(
  # Set the name for the class
  "Bobcat",
  
  # Define the slots - in this case it is empty...
  slots = character(0),
  
  # Set the default values for the slots. (optional)
  prototype=list(),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity=function(object)
  {
    if(sum(object@velocity^2)>85.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  },
  
  # Set the inheritance for this class
  contains = "Agent"
)

######################################################################
# Create the Lynx class
#
# This is used to represent a larger predator
Lynx <- setClass(
  # Set the name for the class
  "Lynx",
  
  # Define the slots - in this case it is empty...
  slots = character(0),
  
  # Set the default values for the slots. (optional)
  prototype=list(),
  
  # Make a function that can test to see if the data is consistent.
  # This is not called if you have an initialize function defined!
  validity=function(object)
  {
    if(sum(object@velocity^2)>95.0) {
      return("The velocity level is out of bounds.")
    }
    return(TRUE)
  },
  
  # Set the inheritance for this class
  contains = "Bobcat"
)

# create a method to move the agent.
setGeneric(name="move",
           def=function(theObject)
           {
             standardGeneric("move")
           }
)

setMethod(f="move",
          signature="Agent",
          definition=function(theObject)
          {
            print("Move this Agent dude")
            theObject <- setVelocity(theObject,c(1,2))
            validObject(theObject)
            return(theObject)
          }
)

setMethod(f="move",
          signature="Prey",
          definition=function(theObject)
          {
            print("Check this Prey before moving this dude")
            theObject <- callNextMethod(theObject)
            print("Move this Prey dude")
            validObject(theObject)
            return(theObject)
          }
)

setMethod(f="move",
          signature="Bobcat",
          definition=function(theObject)
          {
            print("Check this Bobcat before moving this dude")
            theObject <- setLocation(theObject,c(2,3))
            theObject <- callNextMethod(theObject)
            print("Move this Bobcat dude")
            validObject(theObject)
            return(theObject)
          }
)

setMethod(f="move",
          signature="Lynx",
          definition=function(theObject)
          {
            print("Check this Lynx before moving this dude")
            theObject <- setActive(theObject,FALSE)
            theObject <- callNextMethod(theObject)
            print("Move this Lynx dude")
            validObject(theObject)
            return(theObject)
          }
)


robert <- Bobcat()
robert
robert <- move(robert)
robert
lionel <- Lynx()
lionel
lionel <- move(lionel)
lionel
