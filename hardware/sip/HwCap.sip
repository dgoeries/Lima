//###########################################################################
// This file is part of LImA, a Library for Image Acquisition
//
// Copyright (C) : 2009-2011
// European Synchrotron Radiation Facility
// BP 220, Grenoble 38043
// FRANCE
//
// This is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.
//
// This software is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, see <http://www.gnu.org/licenses/>.
//###########################################################################

class HwCap
{
%TypeHeaderCode
#include <iostream>
#include "lima/HwCap.h"
#include "lima/HwDetInfoCtrlObj.h"
#include "lima/HwBufferCtrlObj.h"
#include "lima/HwSyncCtrlObj.h"
#include "lima/HwBinCtrlObj.h"
#include <LimaConvertor.h>
using namespace lima;
%End
public:
	enum Type {
	        Undef,
		DetInfo, Buffer, Sync, 	// Standard: these are mandatory
		Roi, Bin, Flip,		// Image operations
		Kinetics, FrameTransfer,// Acquisition modes
		Timing,			// Read only detector timmings
		Shutter,		// Shutter control
		SerialLine, 		// Generic detector serial line
		Video,			// Video capable usualy color camera 
		Event,			// Asynch. event (error) generator
	};
	HwCap();
	HwCap(const HwCap&);
        HwCap(HwDetInfoCtrlObj*);
	HwCap(HwBufferCtrlObj*);
	HwCap(HwSyncCtrlObj*);
	HwCap(HwBinCtrlObj*);
	HwCap(HwRoiCtrlObj*);
	HwCap(HwFlipCtrlObj*);
	HwCap(HwShutterCtrlObj*);
//	HwCap(HwVideoCtrlObj*);
	HwCap(HwEventCtrlObj*);
	Type getType() const;
	SIP_PYOBJECT getCtrlObj();
%MethodCode
LIMA_CONVERT_HWCAP_TO_SIP_CTRLOBJ(sipCpp, HW);
%End
};
 
