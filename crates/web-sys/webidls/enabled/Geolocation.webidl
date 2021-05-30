/* -*- Mode: IDL; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * The origin of this IDL file is
 * https://www.w3.org/TR/geolocation
 *
 * Copyright © 2021 W3C® (MIT, ERCIM, Keioi, Beihang). W3C
 * liability, trademark and permissive document license rules apply.
 */

dictionary PositionOptions {
  boolean enableHighAccuracy = false;
  [Clamp] unsigned long timeout = 0xFFFFFFFF;
  [Clamp] unsigned long maximumAge = 0;
};

[Exposed=Window]
interface Geolocation {
  undefined getCurrentPosition (
    PositionCallback successCallback,
    optional PositionErrorCallback? errorCallback = null,
    optional PositionOptions options = {}
  );

  long watchPosition (
    PositionCallback successCallback,
    optional PositionErrorCallback? errorCallback = null,
    optional PositionOptions options = {}
  );

  undefined clearWatch (long watchId);
};

callback PositionCallback = undefined (
  GeolocationPosition position
);

callback PositionErrorCallback = undefined (
  GeolocationPositionError positionError
);
