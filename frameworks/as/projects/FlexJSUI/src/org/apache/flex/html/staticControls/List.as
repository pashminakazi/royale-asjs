////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.html.staticControls
{
	import mx.core.IFactory;
	
	import org.apache.flex.core.IDataProviderItemRendererMapper;
	import org.apache.flex.core.IRollOverModel;
	import org.apache.flex.core.ISelectionModel;
	import org.apache.flex.core.UIBase;
	import org.apache.flex.core.ValuesManager;
	
    [Event(name="change", type="org.apache.flex.events.Event")]
    
	/**
	 *  The List class is a component that displays multiple data items. The List uses
	 *  the following bead types:
	 * 
	 *  IBeadModel: the data model, which includes the dataProvider, selectedItem, and
	 *  so forth.
	 *  IBeadView:  the bead that constructs the visual parts of the list.
	 *  IBeadController: the bead that handles input and output.
	 *  IBeadLayout: the bead responsible for the size and position of the itemRenderers.
	 *  IDataProviderItemRendererMapper: the bead responsible for creating the itemRenders.
	 *  IItemRenderer: the class or factory used to display an item in the list.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion FlexJS 0.0
	 */
	public class List extends UIBase
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function List()
		{
			super();
		}
		
		/**
		 *  The name of field within the data used for display. Each item of the
		 *  data should have a property with this name.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get labelField():String
		{
			return ISelectionModel(model).labelField;
		}
		public function set labelField(value:String):void
		{
			ISelectionModel(model).labelField = value;
		}
		
		/**
		 *  The data being display by the List.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
        public function get dataProvider():Object
        {
            return ISelectionModel(model).dataProvider;
        }
        public function set dataProvider(value:Object):void
        {
            ISelectionModel(model).dataProvider = value;
        }

		/**
		 *  The index of the currently selected item. Changing this value
		 *  also changes the selectedItem property.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
        public function get selectedIndex():int
		{
			return ISelectionModel(model).selectedIndex;
		}
		public function set selectedIndex(value:int):void
		{
			ISelectionModel(model).selectedIndex = value;
		}

		/**
		 *  The index of the item currently below the pointer.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
        public function get rollOverIndex():int
		{
			return IRollOverModel(model).rollOverIndex;
		}
		public function set rollOverIndex(value:int):void
		{
			IRollOverModel(model).rollOverIndex = value;
		}
		
		/**
		 *  The item currently selected. Changing this value also 
		 *  changes the selectedIndex property.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get selectedItem():Object
		{
			return ISelectionModel(model).selectedItem;
		}
		public function set selectedItem(value:Object):void
		{
			ISelectionModel(model).selectedItem = value;
		}
		
		/**
		 *  The class or factory used to display each item.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		private var _itemRenderer:IFactory;
		public function get itemRenderer():IFactory
		{
			return _itemRenderer;
		}
		public function set itemRenderer(value:IFactory):void
		{
			_itemRenderer = value;
		}
		
		/**
		 * @private
		 */
		override public function addedToParent():void
		{
            super.addedToParent();
            
            if (getBeadByType(IDataProviderItemRendererMapper) == null)
            {
                var mapper:IDataProviderItemRendererMapper = new (ValuesManager.valuesImpl.getValue(this, "iDataProviderItemRendererMapper")) as IDataProviderItemRendererMapper;
                addBead(mapper);
            }
		}
        
	}
}