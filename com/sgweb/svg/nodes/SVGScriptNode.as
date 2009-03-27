/*
 Copyright (c) 2009 by contributors:

 * James Hight (http://labs.zavoo.com/)
 * Richard R. Masters

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/


package com.sgweb.svg.nodes {
    import com.sgweb.svg.core.SVGNode;
    import flash.events.Event;

    public class SVGScriptNode extends SVGNode {

        public function SVGScriptNode(svgRoot:SVGSVGNode, xml:XML=null, original:SVGNode=null) {
            super(svgRoot, xml, original);
        }

        override protected function drawNode(event:Event = null):void {
            this.removeEventListener(Event.ENTER_FRAME, drawNode);

            //Don't reset _invalidDisplay
            //This way drawNode is only called once
            //this._invalidDisplay = false;

            this.svgRoot.handleScript(this._xml.toXMLString());

            this.visible = false;

            this.svgRoot.renderFinished();
        }

    }
}