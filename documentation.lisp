#|
 This file is a part of Qtools-UI
 (c) 2015 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.qtools.ui)
(in-readtable :qtools)

(defmacro setdocs (&body pairs)
  `(progn
     ,@(loop for (var doc) in pairs
             collect (destructuring-bind (var &optional (type 'cl:function))
                         (if (listp var) var (list var))
                       `(setf (documentation ',var ',type) ,doc)))))


;; cell.lisp
(setdocs
  (padding
   "Padding in the number of pixels to use between the cell edge and the item.")
  
  ((cell type)
   "A cell is a generic item container that is selectable and draggable."))

;; color-sliders.lisp
(setdocs
  ((rgb-color-slider type)
   "A widget for an RGB sliders color chooser.")
  ((hsv-color-slider type)
   "A widget for an HSV sliders color chooser."))

;; color-triangle.lisp
(setdocs  
  ((color-triangle type)
   "A widget for an HSV colour wheel triangle as often used in graphics applications."))

;; compass.lisp
(setdocs
  ((compass type)
   "A layout widget that aligns items North, East, South, West, and Center.
Use the corresponding keywords for the widget places."))

;; container.lisp
(setdocs
  (map-widgets
   "Map the function over the container's widgets.
The mapping order is in sequence with the widget positions.")
  
  (map-items
   "Map the function over the container's items.
The mapping order is in sequence with the item positions.")
  
  (ensure-widget-order
   "Make sure that the widgets of the container are in the right order.
This may change the widget's positions.")
  
  (sorting
   "The function used for sorting the container. If NIL, no sorting is applied.
The function must accept two arguments to compare.")

  (widgets
   "The direct widgets stored in the container.
You should not used this unless you are implementing a container yourself, or know
what you are doing, as the data structure is not necessarily safe to use directly,
or even specified to be of a certain type.")
  
  ((do-widgets)
   "Loop over the container's widgets.

See MAP-WIDGETS")
  
  ((do-items)
   "Loop over the container's items.

See MAP-ITEMS")
  
  ((container type)
   "A simple container to hold a list of widgets and manage the various layout functions.
This does not actually concern itself with arranging the widgets and only handles
the internal representation of the widgets. As such, this class is to be used as
a superclass for an actual layout that then takes care of the widget arrangement.")
  
  ((sorted-container type)
   "A container that also supports automatic sorting of the widgets.

See CONTAINER
See SORTING")
  
  ((item-container type)
   "A container that uses item containers instead of direct widgets.

See CONTAINER
See ITEM-LAYOUT")
  
  ((sorted-item-container type)
   "An item-container that also supports automatic sorting of the items.

See ITEM-CONTAINER
See SORTED-CONTAINER"))

;; draggable.lisp
(setdocs
  (dragging
   "Whether the draggable is currently being dragged.")
  
  (drag-start
   "Called whenever the draggable is beginning to be dragged.
This usually happens during a mouse-press event.")
  
  (drag
   "Called whenever the draggable is being dragged around.
This usually happens during a mouse-move event.")
  
  (drag-end
   "Called whenever the draggable has stopped being dragged.
This usually happens during a mouse-release event.")

  ((draggable type)
   "A helper class to be used when you need to support dragging of your widget.

See DRAGGING
See DRAG-START
See DRAG
See DRAG-END"))

;; executable.lisp
(setdocs
  ((executable type)
   "A qobject superclass that allows running functions within the GUI thread.

See EXECUTE
See EXECUTE-IN-GUI
See WITH-BODY-IN-GUI")

  (execute
   "Performs the execution of an object.

An ABORT restart is always available during the execution of this method.

A standard method for FUNCTION objects exists.")

  (execute-in-gui
   "Schedules the execution to be executed within the executable's GUI thread.

When exactly the execution happens cannot be predetermined. However, it should
be approximately whenever the Qt event loop processes its next batch of events.

See EXECUTABLE
See EXECUTE")

  ((with-body-in-gui)
   "Convenience wrapper macro around EXECUTE-IN-GUI

See EXECUTE-IN-GUI"))

;; items.lisp
(setdocs
  (container
   "The container of the item-widget.

See ITEM-WIDGET")
  
  (widget-item
   "The actual item wrapped by the item-widget.

See ITEM-WIDGET")
  
  (item-widget
   "Find the item-widget for the given item in the layout.")
  
  (coerce-item
   "Create a suitable item-widget for the item.")
  
  (item-at
   "Return the item at the specified place in the layout.")
  
  (item-position
   "Return the position of the item in the layout.

See WIDGET-POSITION")
  
  (find-item
   "Find the item in the layout.

See FIND-WIDGET")
  
  (add-item
   "Add the item to the layout.

See ADD-WIDGET
See COERCE-ITEM")
  
  (insert-item
   "Insert the item into the layout at the specified place.

See INSERT-WIDGET
See COERCE-ITEM")
  
  (remove-item
   "Remove the item from the layout.

See REMOVE-WIDGET
See ITEM-WIDGET")
  
  (remove-item-at
   "Remove the item at the specified place in the layout.

See REMOVE-WIDGET")
  
  (swap-items
   "Swap the two items in their place in the layout.
Note that the implementation might swap the corresponding item-widget,
or it may also choose to swap the items in place. As such, the item-widget's
positions may change, or the actual item-widget of the item may change.")
  
  (swap-items-at
   "Swap the two items at the specified places in the layout.

See SWAP-ITEMS")
  
  (item-acceptable-p
   "A predicate to decide whether the item is suitable for inclusion in the widget.")
  
  (item<
   "Whether A precedes B.
Default methods for STRING and NUMBER exist, as well as a general method that simply
prints the object to a string using PRINC and calls ITEM< again with the results of that.

Add your own methods to this if you need more precise sorting.")
  
  (item=
   "Whether A is equal to B.
Default methods for STRING and NUMBER exist, as well as a general method that simply
prints the object to a string using PRINC and calls ITEM= again with the results of that.

Add your own methods to this if you need more precise sorting.")

  (item>
   "Whether A follows B.
Uses ITEM< and ITEM= to calculate the result. You should not need to add methods to this.")
  
  (item<=
   "Whether A precedes B.
Uses ITEM< and ITEM= to calculate the result. You should not need to add methods to this.")
  
  (item>=
   "Whether A follows B.
Uses ITEM< and ITEM= to calculate the result. You should not need to add methods to this.")
  
  ((item-layout type)
   "A layout to contain items.

See LAYOUT")
  
  ((item-widget type)
   "A widget to contain an item.
Depending on the item type, an item may or may not be contained in multiple item-widgets
at the same time. However, an item-widget itself can only be contained once and only in
one layout at a time."))

;; keychord-editor.lisp
(setdocs
  ((keychord-editor type)
   "A simple dialog to allow dynamic changing of keychords as defined in a menu definition.

See QTOOLS:DEFINE-MENU"))

;; layout.lisp
(setdocs
  (widget
   "Returns the widget at the specified place in the layout.")
  
  (find-widget
   "Find the widget in the layout.

See FIND")
  
  (widget-position
   "Find the position of the widget in the layout.

See POSITION")
  
  (widget-at-point
   "See if there is a widget in the layout at the point and return it if it exists.
POINT can be a cons of X and Y or a QPoint.
The coordinates have to be relative to the layout.")
  
  (add-widget
   "Add the widget to the layout.
The positioning of the widget is completely up to the layout.")
  
  (insert-widget
   "Insert the widget at the specified place in the layout.")
  
  (remove-widget
   "Remove the widget or the widget at the specified place from the layout.")
  
  (swap-widgets
   "Swap the two widgets or the widgets at the specified places in the layout.")
  
  (clear-layout
   "Clear all widgets from the layout.")
  
  (update
   "Update the layout widgets' geometry.

This is automatically called if the layout receives a layout-request event or is resized.
It's also automatically called on the various layout modifying operations.
If you add new operations that modify the layout as well without calling the preexisting
ones, you should call this method to ensure the widgets are restored as appropraite.

If you subclass a layout, you should implement a method on this to calculate yout layouts
widgets' geometry properly.")
  
  (widget-acceptable-p
   "Predicate to determine whether the layout accepts the given widget.
This test is automatically called on all the predefined widget adding functions to make
sure no bad widgets can be inserted into a layout.

You should add methods to this to either further restrict or permit further widgets.
You should call this to check for permission if you add new layout manipulating functions
that don't call out to the standard layout functions.")
  
  ((layout type)
   "Superclass for all custom layout widgets."))

;; listing.lisp
(setdocs
  (minimum-row-height
   "Accessor to the minimum row height of the listing.")
  
  (fixed-row-height
   "Accessor to the fixed row height of the listing.
If NIL, the row heights are dynamic, otherwise the listing will enforce this height.")
  
  (draggable
   "Accessor to whether widgets are draggable or not.")
  
  ((listing type)
   "Replacement for the QListWidget.
Allows sorting, dragging, selecting, and of course dynamic modification of the contents.
Unlike the QListWidget, this allows adding actual widgets, not just strings.")
  
  ((listing-item type)
   "The item container for the listing container."))

;; mouse-propagator.lisp
(setdocs
  (target
   "The target to send the propagated mouse events to.")
  
  ((mouse-propagator type)
   "A helper class that propagates mouse events somewhere else, by default to itself.
This implements an event filter. To catch the events, use QObject::installEventFilter."))

;; panel-container.lisp
(setdocs
  (iconified-p
   "Accessor to whether the panel-container is iconified or not.
If iconified, the panels are not actually shown, only their titles or icons.")
  
  (iconify
   "Iconify the panel-container.

See ICONFIFIED-P")
  
  (deiconify
   "Deiconify the panel-container.

See ICONFIFIED-P")
  
  ((panel-container type)
   "A container for panels.
Supports iconifying, rearranging of the panels, and vertical or horizontal orientation."))

;; panel.lisp
(setdocs  
  (title
   "The title displayed for the panel.")
  
  (detachable-p
   "Accessor to whether the panel is detachable.")
  
  (collapsable-p
   "Accessor to whether the panel is collapsable.")
  
  (titlebar-shown-p
   "Accessor to whether the panel's titlebar is visible.")

  (attached-p
   "Accessor to whether the panel is attached.

See ATTACH
See DETACH")

  (collapsed-p
   "Accessor to whether the panel is collapsed.

See COLLAPSE
See EXPAND")
  
  (attach
   "Tell the panel to attach itself to a container.
If NIL is passed as the container, the panel will try to use the last container it has been
attached to to attach to again. If no container is given or no previous container exists,
an error is signalled. Panels can only be attached to one container at a time.")
  
  (detach
   "Tell the panel to detach itself from a container.
If it is not currently attached to anything, an error is signalled. The panel will remember
the container it has been attached to so it can easily be reattached later.")
  
  (expand
   "Make the panel's center widget visible.")
  
  (collapse
   "Make the panel's center widget invisible.")
  
  (exit
   "Close the panel.")
  
  ((panel type)
   "A dockable and collapsible panel to contain a widget.
Useful in situations where you want to build a UI that contains several parts that the user
should be able to freely arrange to their liking."))

;; repaintable.lisp
(setdocs
  (repaint
   "Cause the repaintable to be repainted.
Unlike QWidget::repaint, this method is safe to be called from any thread as it will use a
signal to reach the main thread in which drawing events are permitted.")
  
  ((repaintable type)
   "A widget that is safely repaintable by offering a method and signal to cause a repaint in the main thread.

See REPAINT"))

;; selectable.lisp
(setdocs
  (active-widget
   "Accessor for the currently active widget on the layout.")
  
  (active-item
   "Accessor for the currently active item on the layout.")
  
  (selectable
   "Accessor for whether selecting a widget/item is allowed.")
  
  ((selectable-layout type)
   "An item-layout that allows selecting a certain item.")

  ((selectable-item type)
   "An item that permits being selected."))

;; slider.lisp
(setdocs
  (maximum
   "Accessor for the maximum of the slider.")
  
  (minimum
   "Accessor for the minimum of the slider.")
  
  (stepping
   "Accessor for the step size of the slider.")
  
  (default
   "Accessor for the slider's default value, if any.")
  
  ((double-slider type)
   "Qt does not provide a floating-point slider, hence this.
It uses a standard slider, but uses an internal divisor to achieve floating point values.

See MAXIMUM
See MINIMUM
See STEPPING")
  
  ((slider type)
   "A neat slider widget that combines a double-slider, a spin box, and a potential defaulting button.
If the default is NIL, no button is displayed.

See MAXIMUM
See MINIMUM
See STEPPING
See DEFAULT"))

;; splitter.lisp
(setdocs
  (resize-widget
   "Resize the layout's widget to the given size.")
  
  (orientation
   "Accessor for the layout's orientation, must be one of :vertical or :horizontal.")
  
  (handle-size
   "Accessor for the size of a splitter's handle.")
  
  ((splitter type)
   "Similar to QSplitter, but instead of distributing all available space, only uses up and extends to as much space as is needed by its widgets."))

;; toolkit.lisp
(setdocs
  (call-with-translation
   "Call the function while translating the painter by the target.

See QPainter::translate")
  
  ((with-translation)
   "Convenience macro around call-with-translation

See CALL-WITH-TRANSLATION")
  
  (color-to-rgba
   "Turns an rgba quadruplet into an integer.")
  
  (rgba-to-color
   "Turns an integer into an rgba quadruplet.")
  
  (c
   "Returns a corresponding QColor object.
Note that these objects are cached. You should never modify them.")
  
  (coerce-color
   "Coerce the color into a QColor object.
Can be either a QColor, a list of the R G B and A components, or an RGBA integer.
If not a direct QColor, the value is resolved as per C.

See RGBA-TO-COLOR
See C"))
