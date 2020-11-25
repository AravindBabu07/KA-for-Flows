import { LightningElement, api } from "lwc";

import defaultTemplate from "./illustration.html";
import GoingCamping from "./GoingCamping.html";
import Maintenance from "./Maintenance.html";
import Desert from "./Desert.html";
import OpenRoad from "./OpenRoad.html";
import NoAccess from "./NoAccess.html";
import NoConnection from "./NoConnection.html";
import NotAvailableInLightning from "./NotAvailableInLightning.html";
import PageNotAvailable from "./PageNotAvailable.html";
import WalkthroughNotAvailable from "./WalkthroughNotAvailable.html";
import FishingDeals from "./FishingDeals.html";
import LakeMountain from "./LakeMountain.html";
import NoEvents from "./NoEvents.html";
import NoTask from "./NoTask.html";
import Setup from "./Setup.html";
import GoneFishing from "./GoneFishing.html";
import NoAccess2 from "./NoAccess2.html";
import NoContent from "./NoContent.html";
import NoPreview from "./NoPreview.html";
import Preview from "./Preview.html";
import Research from "./Research.html";

const allIllustrationMap = {
  "Fishing Deals": FishingDeals,
  "Going Camping": GoingCamping,
  Maintenance: Maintenance,
  Desert: Desert,
  "Open Road": OpenRoad,
  "No Access": NoAccess,
  "No Connection": NoConnection,
  "Not Available In Lightning": NotAvailableInLightning,
  "Page Not Available": PageNotAvailable,
  "Walkthrough Not Available": WalkthroughNotAvailable,
  "Lake Mountain": LakeMountain,
  "No Events": NoEvents,
  "No Task": NoTask,
  Setup: Setup,
  "Gone Fishing": GoneFishing,
  "No Access 2": NoAccess2,
  "No Content": NoContent,
  "No Preview": NoPreview,
  Preview: Preview,
  Research: Research
};

export default class Illustration extends LightningElement {
  @api size = "small";
  @api variant;
  @api heading;
  @api message;

  render() {
    return this.variant ? allIllustrationMap[this.variant] : defaultTemplate;
  }

  get illustrationClass() {
    const baseClass = "slds-illustration slds-illustration_";
    const size = this.size.toLowerCase() === "small" ? "small" : "large";
    return baseClass + size;
  }
}